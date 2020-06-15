use crate::{
    types::{Area, Campaign, Item, Roll, Species, WinCondition, NPC},
    Player, Stats,
};
use anyhow::{anyhow, Result};
use serde::{Deserialize, Serialize};
use std::borrow::Borrow;
use std::collections::BTreeMap;
use std::rc::Rc;

#[derive(Debug, Serialize, Deserialize, Clone)]
pub struct Monster {
    source: crate::types::Monster,
    max_hp: u32,
    current_hp: u32,
    items: Vec<Item>,
    exp: u32,
}

#[derive(Debug)]
pub struct Game {
    pub dm: String,
    pub players: BTreeMap<String, Player>,
    pub campaign: Campaign,
    pub area: Rc<Area>,
    pub battle: Option<Monster>,
}

impl Game {
    pub fn new<T: Into<String>, U: Into<String>>(dm_id: T, campaign_path: U) -> Result<Self> {
        let campaign: Campaign = serde_dhall::from_file(campaign_path.into()).parse()?;
        let area: Area = campaign
            .find_area("start")
            .ok_or(anyhow!("no start area"))?;

        Ok(Game {
            dm: dm_id.into(),
            players: BTreeMap::new(),
            campaign: campaign,
            area: Rc::new(area),
            battle: None,
        })
    }

    pub fn status_message(self) -> String {
        match self.battle {
            Some(monster) => format!(
                "The party is in battle with a {} ({}/{})",
                monster.source.name, monster.current_hp, monster.max_hp
            ),
            None => {
                let area: &Area = self.area.borrow();

                format!(
                    "The party is in the {} in the {}",
                    area.human_name, area.kind
                )
            }
        }
    }

    pub fn add_player<T: Into<String>, U: Into<String>, V: Into<String>>(
        &mut self,
        id: T,
        name: U,
        class: V,
    ) {
        self.players
            .insert(id.into(), Player::new(name.into(), class.into()));
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn new_game() {
        let mut game = Game::new("test", "../campaigns/Miau/package.dhall").unwrap();
        game.add_player("frank", "Frank", "Fighter");
        assert_eq!(game.players.len(), 1);
        assert_eq!(
            game.status_message(),
            "The party is in the starting area in the wasteland"
        )
    }
}
