// Super unoptimized & nasty script. At least it works and is not python ¯\_(ツ)_/¯
// TODO: write it to be more elegant

use std::fs::File;
use std::io::prelude::*;
use std::path::Path;

fn main() {
    let path = Path::new("/home/archy/.config/i3/config");
    let display = path.display();

    let mut file = match File::open(&path) {
        Err(why) => panic!("couldn't read {}: {}", display, why),
        Ok(file) => file,
    };

    let mut s = String::new();
    match file.read_to_string(&mut s){
        Err(why) => panic!("couldn't read {}: {}", display, why),
        Ok(_) => println!("{} contains:", display),
    }

    let lines: Vec<&str> = s.lines().collect();

    let new_path = Path::new("/home/archy/.config/i3/config");
    let new_display = new_path.display();
    let mut new_file = match File::create(&new_path) {
        Err(why) => panic!("couldn't create {}: {}", new_display, why),
        Ok(new_file) => new_file,
    };

    for mut line in lines{
        println!("{}", line);
        if line.contains("setxkbmap -layout") && line.find('#') == Some(0) {
            line = &line[1..];
            let mut line = String::from(line);
            line.push('\n');
            match new_file.write_all(line.as_bytes()) {
                Err(why) => panic!("couldn't write {}: {}", new_display, why),
                Ok(_) => (),
            }
        }
        else if line.contains("setxkbmap -layout") && line.find('#') != Some(0) {
            let mut line = String::from(line);
            line.insert(0, '#');
            line.push('\n');
            match new_file.write_all(line.as_bytes()) {
                Err(why) => panic!("couldn't write {}: {}", new_display, why),
                Ok(_) => (),
            }
        }
        else {
            let mut line = String::from(line);
            line.push('\n');
            match new_file.write_all(line.as_bytes()) {
                Err(why) => panic!("couldn't write {}: {}", new_display, why),
                Ok(_) => (),
            }
        }
    }
}
