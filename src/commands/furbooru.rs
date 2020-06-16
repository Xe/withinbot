use furbooru::Client;
use serenity::{
    framework::standard::{
        macros::{check, command},
        Args, CheckResult,
        CheckResult::{Failure, Success},
        CommandOptions, CommandResult,
        Reason::User,
    },
    model::prelude::*,
    prelude::*,
    utils::MessageBuilder,
};
use std::sync::Arc;
use tokio::sync::Mutex;

pub(crate) fn user_agent(username: String) -> String {
    format!(
        "{}/{} ({}, +{})",
        env!("CARGO_PKG_NAME"),
        env!("CARGO_PKG_VERSION"),
        username,
        env!("CARGO_PKG_REPOSITORY")
    )
}

pub struct FurbooruClientContainer;

impl TypeMapKey for FurbooruClientContainer {
    type Value = Arc<Mutex<Client>>;
}

pub fn make(username: String, api_key: String) -> Arc<Mutex<Client>> {
    Arc::new(Mutex::new(
        Client::new(user_agent(username), api_key).unwrap(),
    ))
}

#[check]
#[name = "nsfw_only"]
async fn nsfw_check(ctx: &Context, msg: &Message, _: &mut Args, _: &CommandOptions) -> CheckResult {
    if let Some(chan) = msg.channel(&ctx.cache).await {
        if chan.is_nsfw() {
            return Success;
        }
    } else {
        if let Ok(chan) = ctx.http.get_channel(*msg.channel_id.as_u64()).await {
            if chan.is_nsfw() {
                return Success;
            }
        }
    }

    Failure(User("run this in a NSFW channel".to_string()))
}

#[command]
#[checks(nsfw_only)]
#[aliases(fb)]
pub async fn furbooru(ctx: &Context, msg: &Message, args: Args) -> CommandResult {
    let tags = args.rest().to_string();

    let data = ctx.data.read().await;
    let cli = data.get::<FurbooruClientContainer>().unwrap();
    let ref cli = *cli.lock().await;

    let result = cli.image_search(tags, 0).await;
    match result {
        Ok(mut imgs) => {
            imgs.truncate(3);

            let mut response = MessageBuilder::new();

            for post in imgs.iter() {
                let mut tags = post.tags.clone();
                tags.sort();
                tags.truncate(8);
                response.push(format!(
                    "<{}> - {} - <{}>\n",
                    format!("http://furbooru.org/{}", post.id),
                    tags.join(", "),
                    post.view_url,
                ));
            }

            if let Err(why) = msg.channel_id.say(&ctx.http, &response.build()).await {
                log::error!("Error sending message: {:?}", why);
            }
        }

        Err(why) => {
            msg.channel_id.say(&ctx.http, format!("{:?}", why)).await?;
        }
    }

    Ok(())
}
