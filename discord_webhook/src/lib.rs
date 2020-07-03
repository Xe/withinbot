use serde::{Deserialize, Serialize};

#[derive(Serialize, Clone, Debug, Deserialize)]
struct AllowedMentions {
    parse: Vec<String>,
}

#[derive(Serialize, Clone, Debug, Deserialize)]
pub struct Body {
    content: String,
    allowed_mentions: AllowedMentions,
}

impl Body {
    pub fn new<T>(body: T) -> Body
    where
        T: Into<String>,
    {
        Body {
            content: body.into(),
            allowed_mentions: AllowedMentions { parse: vec![] },
        }
    }
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
            super::Body::new("hi".to_string()),
        )
        .await
        .unwrap();
    }
}
