sprite_index = spr_rock_spin;

scr_basic_horizontal_movement(rock_constants[? "RUNNING_SPEED"], rock_constants[? "MAX_RUNNING_SPEED"], global.AIR_RESISTANCE, rock_constants[? "REACTIVITY_DECELERATION"]);

if (jump_requested) {
    jump_requested = false;
    y_speed = -rock_constants[? "JUMP_SPEED"];
    if (key_run + 1) {
        y_speed -= rock_constants[? "JUMP_SPEED"] / 4;
    }
}

if (key_jump_longpress == 0 && y_speed < 0  && y_speed < rock_constants[? "CUT_JUMP_SPEED"]) {
    y_speed = rock_constants[? "CUT_JUMP_SPEED"];
}

y_speed += rock_constants[? "GRAV"];

if (y_speed > 0) {
    state = state_rock_falling;
}

if (place_meeting(x, y + 1, par_ground) && y_speed == 0) {
    state = state_rock_default;
}

scr_sprite_mirroring();
scr_limit_speed(rock_constants[? "MAX_HORIZONTAL_SPEED"], rock_constants[? "MAX_VERTICAL_SPEED"]);

