sprite_index = spr_rock_breath;

scr_basic_horizontal_movement(rock_constants[? "RUNNING_SPEED"], rock_constants[? "MAX_RUNNING_SPEED"], global.AIR_RESISTANCE, rock_constants[? "REACTIVITY_DECELERATION"]);

y_speed += rock_constants[? "GRAV"];

if (place_meeting(x, y + MAX_HEIGHT_ALLOWING_JUMP, par_ground) && y_speed >=0 && key_jump == 1) {
    jump_requested = true;
}

if (place_meeting(x, y + 1, par_ground)) {
    if (jump_requested) {
        state = state_rock_jumping;
    } else {
        if (place_meeting(x, y + MAX_HEIGHT_ALLOWING_JUMP, par_ground) && y_speed >=0 && key_jump == 1) {
            jump_requested = true;
        } else {
            state = state_rock_default;
        }
    }
}

if (place_meeting(x, bbox_top, obj_water)) {
    state = state_rock_swimming;
}

scr_sprite_mirroring();
scr_limit_speed(rock_constants[? "MAX_HORIZONTAL_SPEED"], rock_constants[? "MAX_VERTICAL_SPEED"]);

