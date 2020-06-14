use dnd_dice_roller::dice::{Dice, RawResults, RollType};
use std::fmt;

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

pub struct Stats {
    pub name: String,
    pub class: String,
    pub strength: i32,
    pub dexterity: i32,
    pub constitution: i32,
    pub intelligence: i32,
    pub wisdom: i32,
    pub charisma: i32,
    pub hp: u32,
    pub armor: i32,
    pub exp: u32,
    pub level: u32,
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

impl Stats {
    pub fn new(name: String, class: String) -> Self {
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
            name: name,
            class: class,
            strength: roll2stat(simple_roll(2, 6)),
            dexterity: roll2stat(simple_roll(2, 6)),
            constitution: constitution,
            intelligence: roll2stat(simple_roll(2, 6)),
            wisdom: roll2stat(simple_roll(2, 6)),
            charisma: roll2stat(simple_roll(2, 6)),
            hp: hp,
            armor: 0,
            exp: 0,
            level: 1,
        }
    }
}

impl fmt::Display for Stats {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(
            f,
            "{} str, {} dex, {} con, {} int, {} wis, {} cha, {} hp",
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
    fn it_works() {
        assert_eq!(2 + 2, 4);
    }
}
