sprite_index = spr_human_fall;

scr_basic_horizontal_movement(human_constants[? "RUNNING_SPEED"], human_constants[? "MAX_RUNNING_SPEED"], global.AIR_RESISTANCE, human_constants[? "REACTIVITY_DECELERATION"]);

y_speed += human_constants[? "GRAV"];

if (place_meeting(x, y + MAX_HEIGHT_ALLOWING_JUMP, par_ground) && y_speed >=0 && key_jump == 1) {
    jump_requested = true;
}

if (place_meeting(x, y + 1, par_ground)) {
    if (jump_requested) {
        state = state_human_jumping;
    } else {
        state = state_human_default;
    }
}

if (place_meeting(x, bbox_top, obj_water)) {
    state = state_human_swimming;
}

scr_sprite_mirroring();
scr_limit_speed(human_constants[? "MAX_HORIZONTAL_SPEED"], human_constants[? "MAX_VERTICAL_SPEED"]);
