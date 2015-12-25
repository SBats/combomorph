var movement_speed = argument[0];
var max_movement_speed = argument[1];
var resistance = argument[2];
var reactivity_deceleration = argument[3];

x_speed += movement_speed * (key_run + 1) * h_move;
if (x_speed > 0) {
    x_speed = min(max_movement_speed * (key_run + 1), x_speed);    
}
if (x_speed < 0) {
    x_speed = max(-max_movement_speed * (key_run + 1), x_speed);    
}


if (x_speed != 0) {
    if (sign(h_move) != sign(x_speed)) {
        x_speed += reactivity_deceleration * (key_run + 1) * h_move;
    }
    
    if (h_move == 0) {
        if (x_speed * sign(x_speed) < resistance) {
            x_speed = 0;
        } else {
            x_speed -= resistance * sign(x_speed);
        }
    }
    
}
