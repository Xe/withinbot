use crate::{
    types::{Area, Campaign, Item, Roll, Species, WinCondition, NPC},
    Player, Stats,
};
use anyhow::{anyhow, Result};
use serde::{Deserialize, Serialize};
use std::borrow::Borrow;
use std::collections::HashMap;
use std::rc::Rc;

#[derive(Debug, Serialize, Deserialize, Clone)]
pub struct Monster {
    source: crate::types::Monster,
    max_hp: u32,
    current_hp: u32,
    items: Vec<Item>,
    exp: u32,
}

#[derive(Debug, Serialize, Deserialize, Clone)]
pub enum GameState {
    Adventure,
    Monster(Monster),
}

#[derive(Debug, Clone)]
pub struct Game {
    pub dm: String,
    pub players: HashMap<String, Player>,
    pub campaign: Campaign,
    pub area: Rc<Area>,
    pub state: GameState,
}

impl Game {
    pub fn new<T: Into<String>, U: Into<String>>(dm_id: T, campaign_path: U) -> Result<Self> {
        let campaign: Campaign = serde_dhall::from_file(campaign_path.into()).parse()?;
        let area: Area = campaign
            .find_area("start")
            .ok_or(anyhow!("no start area"))?;

        Ok(Game {
            dm: dm_id.into(),
            players: HashMap::new(),
            campaign: campaign,
            area: Rc::new(area),
            state: GameState::Adventure,
        })
    }

    pub fn status_message(&self) -> String {
        match &self.state {
            GameState::Monster(monster) => format!(
                "The party is in battle with a {} ({}/{})",
                monster.source.name, monster.current_hp, monster.max_hp
            ),
            GameState::Adventure => {
                let area: &Area = self.area.borrow();

                format!(
                    "The party is in the {} in the {}\n{}",
                    area.human_name, area.kind, area.description
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

    pub fn won(&self) -> bool {
        let area: &Area = self.area.borrow();
        if area.name != self.campaign.win_condition.area.name {
            return false;
        }

        for (_, player) in self.players.iter() {
            for item in &player.inventory {
                if item.name == self.campaign.win_condition.item.name {
                    return true;
                }
            }
        }

        false
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn new_game() {
        let mut game = Game::new("test", "../campaigns/Miau/package.dhall").unwrap();
        &game.add_player("frank", "Frank", "Fighter");
        assert_eq!(game.players.len(), 1);
        assert_eq!(
            &game.status_message(),
            "The party is in the starting area in the wasteland\nA clearing in the desert, there is a path to the west that leads towards the city of Cihan."
        );
        assert_eq!(game.won(), false);
        let win_item = (&game).campaign.win_condition.item.clone();
        let frank = game.players.get_mut("frank").unwrap();
        frank.inventory.push(win_item);
        assert_eq!(game.won(), true);
    }
}
