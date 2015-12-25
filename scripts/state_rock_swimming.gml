sprite_index = spr_rock_breath;

var ground_object = instance_place(x, y + 1, par_ground);
var waterObject = instance_place(x, bbox_top, obj_water);
if (ground_object != noone) {
    scr_basic_horizontal_movement(rock_constants[? "RUNNING_SPEED"], rock_constants[? "MAX_RUNNING_SPEED"], ground_object.OBJECT_FRICTION, rock_constants[? "REACTIVITY_DECELERATION"]);

    if (x_speed != 0) {
        
        if (key_down == 1) {
            state = state_rock_sliding;
        }
        
    } else {
        state = state_rock_default;
    }
    
    if (key_jump == 1) {
        jump_requested = true;
        state = state_rock_jumping;
    }
} else {
    state = state_rock_falling;
}

y_speed += rock_constants[? "GRAV"] / 2;

scr_sprite_mirroring();
scr_limit_speed(rock_constants[? "MAX_HORIZONTAL_SPEED"], rock_constants[? "MAX_VERTICAL_SPEED"]);

