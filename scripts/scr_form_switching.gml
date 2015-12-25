if (key_next_form > 0) {
    if (current_form == (array_length_1d(form_list) - 1) ) {
        current_form = 0;
    } else {
        current_form += 1;
    }
} else if (key_prev_form > 0) {
    if (current_form == 0 ) {
        current_form = array_length_1d(form_list) - 1;
    } else {
        current_form -= 1;
    }
}

if (key_next_form > 0 || key_prev_form > 0) {
    state = form_list[current_form];
    current_form_constants = form_constants[current_form];
}
