use dnd_dice_roller::dice::{Dice, RawResults, RollType};
use std::fmt;

pub mod types;

fn roll2stat(roll: i32) -> i32 {
    match roll {
        12 | 11 => 2,
        9 | 10 => 1,
        6 | 7 | 8 => 0,
        4 | 5 => -1,
        _ => -2,
    }
}

fn simple_roll(num: u32, sides: u32) -> i32 {
    let dice = Dice::new(num, sides, None, RollType::Regular);
    let res = dice.roll_dice();
    let res = res.final_result;
    res[0]
}

/// A human player
#[derive(Debug)]
pub struct Player {
    pub name: String,
    pub class: String,
    pub species: types::Species,
    pub stats: Stats,
    pub exp: u32,
    pub level: u32,
    pub armor: i32,
}

impl Player {
    pub fn new(name: String, class: String) -> Self {
        Player {
            name: name,
            class: class,
            species: types::Species::Human,
            stats: Stats::new(),
            exp: 0,
            level: 1,
            armor: 0,
        }
    }
}

impl fmt::Display for Player {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(
            f,
            "{} the level {} {} {}: {}, armor: {}, exp: {}",
            self.name, self.level, self.species, self.class, self.stats, self.armor, self.exp
        )
    }
}

fn max_of_all_dice(data: RawResults) -> u32 {
    let mut dice = Vec::<u32>::new();

    for roll in data.first_roll.iter() {
        dice.push(*roll)
    }

    if data.second_roll.is_some() {
        for roll in data.second_roll.unwrap().iter() {
            dice.push(*roll)
        }
    }

    *dice.iter().max().unwrap()
}

#[derive(Debug)]
pub struct Stats {
    pub strength: i32,
    pub dexterity: i32,
    pub constitution: i32,
    pub intelligence: i32,
    pub wisdom: i32,
    pub charisma: i32,
    pub hp: u32,
}

impl Stats {
    pub fn new() -> Self {
        let constitution = roll2stat(simple_roll(2, 6));
        let dice = Dice::new(
            if constitution >= 0 {
                1 + &constitution
            } else {
                1
            } as u32,
            6,
            None,
            RollType::Advantage,
        );
        let result = dice.roll_dice();
        log::debug!("HP roll: {:?}", result);
        let hp = max_of_all_dice(result.dice_results);
        Stats {
            strength: roll2stat(simple_roll(2, 6)),
            dexterity: roll2stat(simple_roll(2, 6)),
            constitution: constitution,
            intelligence: roll2stat(simple_roll(2, 6)),
            wisdom: roll2stat(simple_roll(2, 6)),
            charisma: roll2stat(simple_roll(2, 6)),
            hp: hp,
        }
    }
}

impl fmt::Display for Stats {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(
            f,
            "STR: {}, DEX: {}, CON: {}, INT: {}, WIS: {}, CHA: {}, HP: {}",
            self.strength,
            self.dexterity,
            self.constitution,
            self.intelligence,
            self.wisdom,
            self.charisma,
            self.hp
        )
    }
}

#[cfg(test)]
mod tests {
    #[test]
    fn load_campaign() {
        println!("loading...");
        let camp: super::types::Campaign = serde_dhall::from_file("../campaigns/Miau/package.dhall").parse().unwrap();
        println!("loaded");
    }
}
