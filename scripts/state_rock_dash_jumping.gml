sprite_index = spr_rock_spin;

if (place_meeting(x, bbox_top, obj_water)) {
    state = state_rock_swimming;
} else {

    var ground_object = instance_place(x, y + 1, par_ground);
    var resistance;
    if (ground_object != noone) {
        resistance = ground_object.OBJECT_FRICTION;
    } else {
        resistance = global.AIR_RESISTANCE;
    }
    
    scr_basic_horizontal_movement(rock_constants[? "RUNNING_SPEED"] * rock_constants[? "DASHING_SPEED_COEFF"], rock_constants[? "MAX_RUNNING_SPEED"] * rock_constants[? "DASHING_SPEED_COEFF"], resistance, rock_constants[? "REACTIVITY_DECELERATION"] );
    
    
    if (jump_requested) {
        jump_requested = false;
        y_speed = -rock_constants[? "JUMP_SPEED"];
    }
    
    if (key_jump_longpress == 0 && y_speed < 0  && y_speed < rock_constants[? "CUT_JUMP_SPEED"]) {
        y_speed = rock_constants[? "CUT_JUMP_SPEED"];
    }
    
    y_speed += rock_constants[? "GRAV"] / 2.5;
    
    if (y_speed > 0 ||(place_meeting(x, y + 1, par_ground) && y_speed == 0)) {
        state = state_rock_dashing;
    }

}
    
scr_sprite_mirroring();
scr_limit_speed(rock_constants[? "MAX_HORIZONTAL_SPEED"], rock_constants[? "MAX_VERTICAL_SPEED"]);

