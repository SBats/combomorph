sprite_index = spr_human_crouch;

if (!place_meeting(x, y + 1, par_ground)) {
    state = state_human_falling;
} else {
    if (x_speed != 0) {
        if (key_down == 1) {
            state = state_human_sliding;
        } else {
            state = state_human_running;
        }
    } else {
        if (key_down == 0) {
            state = state_human_default;
        }
    }
}

scr_sprite_mirroring();
