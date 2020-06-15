use crate::{
    types::{Area, Campaign, Item, Monster, Roll, Species, WinCondition, NPC},
    Player, Stats,
};
use anyhow::{anyhow, Result};
use std::collections::BTreeMap;
use std::rc::Rc;

pub struct Game {
    pub dm: String,
    pub players: BTreeMap<String, Player>,
    pub campaign: Campaign,
    pub area: Rc<Area>,
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
        })
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
    }
}
