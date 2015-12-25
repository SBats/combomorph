/// Player's inputs
///////////////////////

key_right = keyboard_check(vk_right);
key_left = -keyboard_check(vk_left);
key_down = keyboard_check(vk_down);
key_up = keyboard_check(vk_up);
key_dash = keyboard_check(vk_shift);
key_run = 1;
key_jump = keyboard_check_pressed(vk_space);
key_jump_longpress = keyboard_check(vk_space);
key_next_form = keyboard_check_pressed(ord('D'));
key_prev_form = keyboard_check_pressed(ord('Q'));

h_move = key_right + key_left;
v_move = key_up - key_down;
