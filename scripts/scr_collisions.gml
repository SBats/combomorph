//////////////////
// Collisions
//////////////////

var h, v, collide, slope;

x_speed_counter += x_speed;
y_speed_counter += y_speed;
h = round( x_speed_counter );
v = round( y_speed_counter );
x_speed_counter -= h;
y_speed_counter -= v;

collide = false;
slope = false;
repeat (abs(h))
{
    if (place_meeting(x + sign(h), y, par_solid))
    {
        if (!place_meeting(x + sign(h), y - 1, par_solid))
        {
            //Running up slopes
            y -= 1;
            x += sign(h);
            slope = true;
        }
        else
        {
            //Hit a wall
            collide = true;
            break;
        }
    }
    else
    {
        if (on_ground)
        {
            if (!place_meeting(x + sign(h), y + 1, par_solid) && place_meeting(x + sign(h), y + 2, par_solid))
                y += 1;
        }
        x += sign(h);  
    }

}

if (collide)
    event_perform(ev_other, ev_user0);
    
if (slope)
    x_speed = approach(x_speed, 0, SLOPE_SPEED_COEFF);
    
collide = false;
repeat (abs(v))
{
    if (y_speed <= 0)
    {
        if (place_meeting( x, y + sign(v), par_solid))
        {
            collide = true;
            break;
        }
        else
            y += sign(v);
    }
    else if (place_meeting( x, y + 1, par_solid))
    {
        collide = true;
        break;
    }
    else
        y += sign(v);

}

if (collide)
    event_perform( ev_other, ev_user1 );
