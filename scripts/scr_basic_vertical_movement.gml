var movement_speed = argument[0];
var max_movement_speed = argument[1];
var resistance = argument[2];
var reactivity_deceleration = argument[3];

y_speed += movement_speed * (key_run + 1) * -v_move;
if (y_speed > 0) {
    y_speed = min(max_movement_speed * (key_run + 1), y_speed);    
}
if (y_speed < 0) {
    y_speed = max(-max_movement_speed * (key_run + 1), y_speed);    
}


if (y_speed != 0) {
    if (sign(v_move) != sign(y_speed)) {
        y_speed += reactivity_deceleration * (key_run + 1) * -v_move;
    }
    
    if (v_move == 0) {
        if (y_speed * sign(y_speed) < resistance) {
            y_speed = 0;
        } else {
            y_speed -= resistance * sign(y_speed);
        }
    }
    
}
