mod commands;

use log::info;
use serenity::{
    async_trait,
    client::bridge::gateway::ShardManager,
    framework::standard::{
        help_commands,
        macros::{group, help},
        Args, CommandGroup, CommandResult, HelpOptions, StandardFramework,
    },
    http::Http,
    model::{event::ResumedEvent, gateway::Ready, prelude::*},
    prelude::*,
};
use std::{collections::HashSet, env, sync::Arc};

use commands::{furbooru::*, meta::*, owner::*, printerfacts::*, six_e::*};

struct ShardManagerContainer;

impl TypeMapKey for ShardManagerContainer {
    type Value = Arc<Mutex<ShardManager>>;
}

struct Handler;

#[async_trait]
impl EventHandler for Handler {
    async fn ready(&self, _: Context, ready: Ready) {
        info!("Connected as {}", ready.user.name);
    }

    async fn resume(&self, _: Context, _: ResumedEvent) {
        info!("Resumed");
    }
}

#[group]
#[commands(ping, quit, printerfact)]
#[description = "General bot commands"]
struct General;

#[group]
#[commands(roll, roll_stats)]
#[description = "Commands for [6E](https://s-jared.itch.io/6e) games. These may be useful for other DnD-like games too"]
struct SixE;

#[group]
#[commands(furbooru)]
#[description = "image searching for boorus"]
struct Booru;

#[help]
#[individual_command_tip = "Hello! Saluton! coi!\n\
If you want more information about a specific command, just pass the command as argument."]
#[command_not_found_text = "Could not find: `{}`."]
#[max_levenshtein_distance(3)]
#[indention_prefix = "+"]
#[lacking_permissions = "Hide"]
#[lacking_role = "Nothing"]
#[wrong_channel = "Strike"]
async fn my_help(
    context: &Context,
    msg: &Message,
    args: Args,
    help_options: &'static HelpOptions,
    groups: &[&'static CommandGroup],
    owners: HashSet<UserId>,
) -> CommandResult {
    help_commands::with_embeds(context, msg, args, help_options, groups, owners).await
}

#[tokio::main]
async fn main() -> anyhow::Result<()> {
    kankyo::init()?;
    pretty_env_logger::init();

    let token = env::var("DISCORD_TOKEN").expect("Expected a token in the environment");
    let http = Http::new_with_token(&token);
    let (owners, bot_id) = match http.get_current_application_info().await {
        Ok(info) => {
            let mut owners = HashSet::new();
            owners.insert(info.owner.id);

            (owners, info.id)
        }
        Err(why) => panic!("Could not access application info: {:?}", why),
    };

    let framework = StandardFramework::new()
        .configure(|c| {
            c.owners(owners)
                .delimiters(vec![", ", ","])
                .prefix("~")
                .with_whitespace(true)
                .on_mention(Some(bot_id))
        })
        .help(&MY_HELP)
        .group(&GENERAL_GROUP)
        .group(&SIXE_GROUP)
        .group(&BOORU_GROUP);
    let mut client = Client::new(&token)
        .framework(framework)
        .event_handler(Handler)
        .await?;

    {
        let mut data = client.data.write().await;
        data.insert::<ShardManagerContainer>(Arc::clone(&client.shard_manager));
        data.insert::<FactsContainer>(commands::printerfacts::make());
        data.insert::<FurbooruClientContainer>(commands::furbooru::make(
            std::env::var("FURBOORU_BOT_OWNER")?,
            std::env::var("FURBOORU_TOKEN")?,
        ));
    }

    let _owners = match client
        .cache_and_http
        .http
        .get_current_application_info()
        .await
    {
        Ok(info) => {
            let mut set = HashSet::new();
            set.insert(info.owner.id);

            set
        }
        Err(why) => panic!("Couldn't get application info: {:?}", why),
    };

    client.start().await?;

    Ok(())
}
