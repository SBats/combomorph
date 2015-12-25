sprite_index = spr_rock_crouch;

if (!place_meeting(x, y + 1, par_ground)) {
    state = state_rock_falling;
} else {
    if (x_speed != 0) {
        if (key_down == 0) {
            state = state_rock_sliding;
        } else {
            state = state_rock_running;
        }
    } else {
        if (key_down == 0) {
            state = state_rock_default;
        }
    }
}

scr_sprite_mirroring();

