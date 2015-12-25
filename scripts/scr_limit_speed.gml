var max_horizontal_speed = argument[0];
var max_vertical_speed = argument[1];

// Limit hoizontal Speed
x_speed = min(abs(x_speed), max_horizontal_speed) * sign(x_speed);

// Limit Vertical Speed
y_speed = min(abs(y_speed), max_vertical_speed) * sign(y_speed);
