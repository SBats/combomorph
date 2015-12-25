if (!can_dash && !is_dashing) {
    state = state_human_default;
} else if (h_move != 0 || is_dashing) {
    if (!is_dashing) {
        var dashing_length = human_constants[? "DASHING_LENGTH"];
        can_dash = false;
        is_dashing = true;
        alarm[0] = dashing_length;
    }
    xSpeed = human_constants[? "DASHING_SPEED"] * h_move;
    ySpeed = 0;
}
