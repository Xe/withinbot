mod commands;
mod config;

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
use std::{collections::HashSet, sync::Arc};

use commands::{furbooru::*, meta::*, owner::*, printerfacts::*, six_e::*, swatch::*};
use config::*;

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
#[commands(ping, quit, printerfact, beats)]
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
#[lacking_role = "Hide"]
#[wrong_channel = "Hide"]
async fn my_help(
    context: &Context,
    msg: &Message,
    args: Args,
    help_options: &'static HelpOptions,
    groups: &[&'static CommandGroup],
    owners: HashSet<UserId>,
) -> CommandResult {
    let _ = help_commands::with_embeds(context, msg, args, help_options, groups, owners).await;
    Ok(())
}

#[tokio::main]
async fn main() -> anyhow::Result<()> {
    kankyo::init()?;
    env_logger::init();
    let config: Config = envy::from_env()?;

    let http = Http::new_with_token(&config.discord_token);
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
                .prefixes(vec!["~", "!"])
                .with_whitespace(true)
                .on_mention(Some(bot_id))
        })
        .help(&MY_HELP)
        .group(&GENERAL_GROUP)
        .group(&SIXE_GROUP)
        .group(&BOORU_GROUP);
    let mut client = Client::new(&config.discord_token)
        .framework(framework)
        .event_handler(Handler)
        .await?;

    {
        let mut data = client.data.write().await;
        data.insert::<ShardManagerContainer>(Arc::clone(&client.shard_manager));
        data.insert::<FactsContainer>(commands::printerfacts::make());
        data.insert::<FurbooruClientContainer>({
            let config = config.clone();
            commands::furbooru::make(config.furbooru_bot_owner, config.furbooru_token)
        });
        data.insert::<ConfigContainer>(config.make());
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
