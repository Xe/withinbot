use dnd_dice_roller::dice::{Dice, RollType};
use serenity::framework::standard::{macros::command, Args, CommandResult};
use serenity::model::prelude::*;
use serenity::prelude::*;
use std::str::FromStr;

#[command]
pub async fn roll(ctx: &Context, msg: &Message, mut args: Args) -> CommandResult {
    args.trimmed();
    let roll = args.message();
    let mut dice = Dice::from_str(roll)?;
    dice.roll_type = RollType::Advantage;
    let res = dice.roll_dice();
    let res = res.final_result;
    let reply = &format!("{}", res[0]);

    msg.channel_id.say(&ctx.http, reply).await?;

    Ok(())
}

#[command]
pub async fn roll_stats(ctx: &Context, msg: &Message, mut args: Args) -> CommandResult {
    msg.reply(ctx, &format!("Your stats are: {}", six_e::Stats::new()))
        .await?;

    Ok(())
}
