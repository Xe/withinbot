use serenity::prelude::*;
use serenity::model::prelude::*;
use serenity::framework::standard::{
    Args, CommandResult,
    macros::command,
};
use std::str::FromStr;
use dnd_dice_roller::dice::Dice;

#[command]
pub async fn roll(ctx: &Context, msg: &Message, mut args: Args) -> CommandResult {
    args.trimmed();
    let roll = args.message();
    let dice = Dice::from_str(roll)?;
    let res = dice.roll_dice();
    let res = res.final_result;
    let reply = &format!("{}", res[0]);

    msg.channel_id.say(&ctx.http, reply).await?;

    Ok(())
}
