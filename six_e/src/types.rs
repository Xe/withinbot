use serde::{Deserialize, Serialize};
use std::fmt;

#[derive(Debug, Serialize, Deserialize)]
pub struct Campaign {
    pub areas: Vec<Area>,
    pub items: Vec<Item>,
    pub monsters: Vec<Monster>,
}

#[derive(Debug, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct Area {
    pub name: String,
    pub human_name: String,
    pub description: String,
    pub links: Vec<String>,
    pub monsters: Vec<Monster>,
    pub npcs: Vec<NPC>,
    pub items: Vec<Item>,
    pub kind: String,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Bonus {
    pub stat: Option<Stat>,
    pub amount: Option<i32>,
    pub area: Option<String>,
    pub when: Option<Roll>,
    pub species: Option<Species>,
    pub polymorph: Option<Species>,
}

#[derive(Debug, Serialize, Deserialize)]
pub enum ItemKind {
    Weapon,
    Armor,
    Trinket,
    Gear,
    Consumable,
}

#[derive(Debug, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct Item {
    pub name: String,
    pub description: String,
    pub weight: u32,
    pub bonuses: Vec<Bonus>,
    pub cost: u32,
    pub sell_value: Option<u32>,
    pub charges: Option<u32>,
    pub legendary: bool,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Monster {
    pub name: String,
    pub damage: Roll,
    pub hp: Range<u32>,
    pub armor: u32,
    pub exp: Roll,
    pub items: Vec<MonsterItem>,
    pub drops: Vec<Item>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct MonsterItem {
    pub dice: Option<Roll>,
    pub item: Item,
}

#[derive(Debug, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct NPC {
    pub name: String,
    pub job: String,
    pub sell_items: Vec<Item>,
    pub species: Species,
    pub dialogue: Vec<String>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Range<T> {
    low: T,
    high: T,
}

#[derive(Debug, Serialize, Deserialize)]
pub enum Species {
    Human,
    Feline,
    Shark,
    Cetacean,
}

impl fmt::Display for Species {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(
            f,
            "{}",
            match self {
                Species::Human => "Human",
                Species::Feline => "Feline",
                Species::Cetacean => "Cetacean",
                Species::Shark => "Shark",
            }
        )
    }
}

#[derive(Debug, Serialize, Deserialize)]
pub enum Stat {
    STR,
    DEX,
    CON,
    INT,
    WIS,
    CHA,
    ATK,
    DEF,
    RISK,
    HP,
}

#[derive(Debug, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct Roll {
    pub dice_count: Option<u32>,
    pub dice_sides: u32,
    pub min: Option<u32>,
    pub level: bool,
    pub plus: Option<i32>,
}
