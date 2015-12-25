sprite_index = spr_rock_breath;

if (!place_meeting(x, y + 1, par_ground)) {
    state = state_rock_falling;
} else if (place_meeting(x, bbox_top, obj_water)) {
    state = state_rock_swimming;
} else {
    if (key_down == 1) {
        state = state_rock_crouching;
    } else if (h_move != 0 || x_speed != 0) {
        state = state_rock_running;
    }
    
    if (key_jump == 1) {
        jump_requested = true;
        state = state_rock_jumping;
    }
}


