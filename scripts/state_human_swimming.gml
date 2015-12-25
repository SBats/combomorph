sprite_index = spr_human_swim;

var water_object = instance_place(x, bbox_top, obj_water);

scr_basic_horizontal_movement(human_constants[? "SWIMMING_SPEED"], human_constants[? "MAX_SWIMMING_SPEED"], water_object.OBJECT_FRICTION, human_constants[? "REACTIVITY_DECELERATION"]);
scr_basic_vertical_movement(human_constants[? "SWIMMING_SPEED"], human_constants[? "MAX_SWIMMING_SPEED"], water_object.OBJECT_FRICTION, human_constants[? "REACTIVITY_DECELERATION"]);


if (!place_meeting(x, bbox_top - ((bbox_bottom - bbox_top) / 2), obj_water)) {
        
    if (y_speed < 0) {
        y_speed = 0;
    }
    
    //Toggle jump if jump is pressed or requested
    if (key_jump_longpress == 1) {
        jump_requested = true;
        state = state_human_jumping;
    }
}

scr_sprite_mirroring();
scr_limit_speed(human_constants[? "MAX_HORIZONTAL_SPEED"], human_constants[? "MAX_VERTICAL_SPEED"]);
