sprite_index = spr_rock_breath;

x_speed = 0;
y_speed = 0;

var grabbed_object = instance_place(x + sign(image_xscale), y, par_wall);
if (grabbed_object != noone) {

    scr_basic_vertical_movement(rock_constants[? "RUNNING_SPEED"], rock_constants[? "MAX_RUNNING_SPEED"], 0, 0);

    if (key_jump == 1) {
        
        if (sign(h_move) == -sign(image_xscale)) {
            x_speed = (rock_constants[? "JUMP_SPEED"]) * -sign(image_xscale);
            image_xscale = -image_xscale;
        } else {
            x_speed = 2 * -sign(image_xscale);
        }

        jump_requested = true;
        state = state_rock_jumping;
    }
}
if (place_meeting(x, y + 1, par_ground) || grabbed_object == noone) {
    state = state_rock_default;
}
scr_limit_speed(rock_constants[? "MAX_HORIZONTAL_SPEED"], rock_constants[? "MAX_VERTICAL_SPEED"]);

