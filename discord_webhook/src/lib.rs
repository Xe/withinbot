use serde::{Deserialize, Serialize};

#[derive(Serialize, Clone, Debug, Deserialize)]
pub struct Body {
    pub content: String,
}

/// Execute a Discord webhook with the given Body.
pub async fn execute(url: String, body: Body) -> Result<(), reqwest::Error> {
    reqwest::Client::new()
        .post(&url)
        .json(&body)
        .send()
        .await?
        .error_for_status()?;

    Ok(())
}

#[cfg(test)]
mod tests {
    use httptest::{matchers::*, responders::*, Expectation, Server};

    #[tokio::test]
    async fn execute() {
        let server = Server::run();
        server.expect(Expectation::matching(any()).respond_with(status_code(200)));

        super::execute(
            format!("{}", server.url("/")),
            super::Body {
                content: "hi".to_string(),
            },
        )
        .await
        .unwrap();
    }
}
