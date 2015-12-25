sprite_index = spr_human_run;

var ground_object = instance_place(x, y + 1, par_ground);
if (ground_object != noone) {
    scr_basic_horizontal_movement(human_constants[? "RUNNING_SPEED"], human_constants[? "MAX_RUNNING_SPEED"], ground_object.OBJECT_FRICTION, human_constants[? "REACTIVITY_DECELERATION"]);

    if (x_speed != 0) {
        
        if (key_down == 1) {
            state = state_human_sliding;
        }
        
    } else {
        state = state_human_default;
    }
    
    if (key_jump == 1) {
        jump_requested = true;
        state = state_human_jumping;
    }
} else {
    state = state_human_falling;
}

y_speed += human_constants[? "GRAV"];

scr_sprite_mirroring();
scr_limit_speed(human_constants[? "MAX_HORIZONTAL_SPEED"], human_constants[? "MAX_VERTICAL_SPEED"]);
