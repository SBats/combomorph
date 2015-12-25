sprite_index = spr_human_wall_grab;

x_speed = 0;
y_speed = 0;

var grabbed_object = instance_place(x + sign(image_xscale), y, par_wall);
if (grabbed_object != noone) {
    y_speed += (human_constants[? "GRAV"] - grabbed_object.objectFriction);

    if (key_down == 1) {
        y_speed *= 4;
    }
    if (key_jump == 1) {
        
        if (sign(h_move) == -sign(image_xscale)) {
            x_speed = (human_constants[? "JUMP_SPEED"]) * -sign(image_xscale);
            image_xscale = -image_xscale;
        } else {
            x_speed = 2 * -sign(image_xscale);
        }

        jump_requested = true;
        state = state_human_jumping;
    }
}
if (place_meeting(x, y + 1, par_ground) || grabbed_object == noone) {
    state = state_human_default;
}
scr_limit_speed(human_constants[? "MAX_HORIZONTAL_SPEED"], human_constants[? "MAX_VERTICAL_SPEED"]);
