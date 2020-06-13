use rand::prelude::*;
use serenity::{
    framework::standard::{macros::command, CommandResult},
    model::prelude::*,
    prelude::*,
};

pub struct FactsContainer;

impl TypeMapKey for FactsContainer {
    type Value = pfacts::Facts;
}

pub fn make() -> pfacts::Facts {
    pfacts::make()
}

#[command]
pub async fn printerfact(ctx: &Context, msg: &Message) -> CommandResult {
    let data = ctx.data.read().await;
    let value = data.get::<FactsContainer>().unwrap();
    let ref facts = *value;
    let i = thread_rng().gen::<usize>() % facts.len();

    msg.reply(ctx, &facts[i]).await?;

    Ok(())
}
