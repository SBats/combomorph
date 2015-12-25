sprite_index = spr_human_slide;
var ground_object = instance_place(x, y + 1, par_ground);

if (ground_object == noone) {
    state = state_human_falling;
} else {
    if (abs(x_speed) < ground_object.OBJECT_FRICTION) {
        x_speed = 0;
    } else {
        x_speed -= ground_object.OBJECT_FRICTION * sign(x_speed) / 4;
    }
    
    if (x_speed == 0) {
        if (key_down == 0) {
            state = state_human_default;
        } else {
            state = state_human_crouching;
        }
    } else {
        if (key_down == 0) {
            state = state_human_running;
        }
    }
    
}

scr_sprite_mirroring();
