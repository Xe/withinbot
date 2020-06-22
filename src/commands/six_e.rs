use anyhow::Result;
use dnd_dice_roller::dice::Dice;
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
            log::info!("{} asked to roll {}: {}", msg.author.name, roll, reply);
            msg.channel_id.say(&ctx.http, reply).await?;
        }
        Err(why) => {
            log::error!("error parsing dice roll: {:?}", why);
            msg.channel_id
                .say(
                    &ctx.http,
                    format!("error parsing dice roll:\n```{:?}```", why),
                )
                .await?;
        }
    };

    Ok(())
}

fn dice_roll<T: Into<String>>(roll: T) -> Result<String> {
    let dice = Dice::from_str(&roll.into())?;
    let res = dice.roll_dice();
    let reply = format!(
        "```\n{}{} = {}\n```",
        res.dice_results,
        match dice.modifier {
            Some(amt) => format!(" + {}", amt),
            None => "".into(),
        },
        res.final_result[0]
    );
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

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn dice() {
        dice_roll("3d6").unwrap();
        assert!(dice_roll("butts").is_err());
    }
}
