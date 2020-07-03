use anyhow::Result;

#[tokio::main]
async fn main() -> Result<()> {
    discord_webhook::execute(
        std::env::var("DISCORD_WEBHOOK")?,
        discord_webhook::Body {
            content: "Hiiiii".to_string(),
        },
    )
    .await?;

    Ok(())
}
