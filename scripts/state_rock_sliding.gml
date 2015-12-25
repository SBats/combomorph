sprite_index = spr_rock_spin;
var ground_object = instance_place(x, y + 1, par_ground);

if (ground_object == noone) {
    state = state_rock_falling;
} else {
    if (abs(x_speed) < ground_object.OBJECT_FRICTION) {
        x_speed = 0;
        state = state_rock_crouching;
    } else {
        x_speed -= ground_object.OBJECT_FRICTION * sign(x_speed) / 4;
    }
    if (key_down == 0) {
        state = state_rock_default;
    }
}

scr_sprite_mirroring();

