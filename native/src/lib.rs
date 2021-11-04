mod hello_world;

use gdnative::prelude::*;

fn init(handle: InitHandle) {
    hello_world::init(handle)
}

godot_init!(init);
