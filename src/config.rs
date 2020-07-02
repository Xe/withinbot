use serde::{Deserialize, Serialize};
use serenity::prelude::TypeMapKey;
use std::{path::PathBuf, sync::Arc};
use tokio::sync::Mutex;

#[derive(Serialize, Deserialize, Clone, Debug)]
pub(crate) struct Config {
    #[serde(skip_serializing)]
    pub discord_token: String,

    pub furbooru_bot_owner: String,
    #[serde(skip_serializing)]
    pub furbooru_token: String,

    pub campaign_folder: PathBuf,
}

impl Config {
    pub(crate) fn make(&self) -> Arc<Mutex<Config>> {
        Arc::new(Mutex::new(self.clone()))
    }
}

pub(crate) struct ConfigContainer;

impl TypeMapKey for ConfigContainer {
    type Value = Arc<Mutex<Config>>;
}
