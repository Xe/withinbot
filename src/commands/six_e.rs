use anyhow::Result;
use dnd_dice_roller::dice::{Dice, RollType};
use serenity::framework::standard::{macros::command, Args, CommandResult};
use serenity::model::prelude::*;
use serenity::prelude::*;
use std::str::FromStr;

#[command]
#[aliases(r, dice, d)]
#[description = "Rolls dice using standard DnD dice notation. By default this rolls for advantage, or the best of two rolls."]
#[min_args(1)]
#[usage = "<dice>[+-bonus]"]
#[example = "1d6+4"]
pub async fn roll(ctx: &Context, msg: &Message, mut args: Args) -> CommandResult {
    args.trimmed();
    let roll = args.message();

    match dice_roll(roll) {
        Ok(reply) => {
            msg.channel_id.say(&ctx.http, reply).await?;
        }
        Err(why) => {
            msg.channel_id
                .say(&ctx.http, format!("error parsing dice roll:\n```{:?}```", why))
                .await?;
        }
    };

    Ok(())
}

fn dice_roll(roll: &str) -> Result<String> {
    let mut dice = Dice::from_str(roll)?;
    dice.roll_type = RollType::Advantage;
    let res = dice.roll_dice();
    let res = res.final_result;
    let reply = format!("{}", res[0]);
    Ok(reply)
}

#[command]
#[aliases(stats)]
#[description = "Roll stats for a new 6E character."]
#[num_args(0)]
pub async fn roll_stats(ctx: &Context, msg: &Message) -> CommandResult {
    msg.reply(ctx, &format!("Your stats are: {}", six_e::Stats::new()))
        .await?;

    Ok(())
}
