///// NEW /////


heightInTiles = (bbox_bottom - bbox_top) / 16;
widthInTiles = (bbox_right - bbox_left) / 16;
xBboxLimit = 0;
yBboxLimit = 0;
closestBlock = 0;
xFacing = 0;
yFacing = 0;

if (xSpeed < 0 || (xSpeed == 0 && image_xscale == -1)) {
    xBboxLimit = bbox_left;
} else {
    xBboxLimit = bbox_right;
}

if (ySpeed < 0) {
    xBboxLimit = bbox_top;
} else {
    xBboxLimit = bbox_bottom;
}



for (i = heightInTiles; i > 0; i--) {
    
    var inst;
    var x1;
    var x2;
    var y1;
    var y2;
    
    if (xBboxLimit == bbox_left) {
        x1 = 0;
        x2 = xBboxLimit;
    } else {
        x1 = xBboxLimit;
        x2 = view_wview[0];
    }
    
    y1 = yBboxLimit;
    y2 = yBboxLimit + 15;
    
    inst = collision_rectangle(x1, y1, x2, y2, par_solid, false, false); 
    if (inst != noone) {
        with (inst) {
            if ((xBboxLimit == bbox_left && x > closestBlock.x && x < xBboxLimit)
                || (xBboxLimit == bbox_right && x < closestBlock.x && x > xBboxLimit)) {
                closestBlock = id;
            }
            
        }
    } 
}

if (xBboxLimit == bbox_left) {
    x += max(xSpeed, closestBlock.x - x);
} else {
    x += min(xSpeed, closestBlock.x - x);
}


global.xspeed = xSpeed;
global.yspeed = ySpeed;
global.closestBlock = closestBlock;
global.closestBlockX = closestBlock.x - x;





//////// OLD ////////


nextCollisionObject = instance_place(x + xSpeed, y, par_solid);
underCollisionObject = instance_place(x, y+1, par_solid);
if (nextCollisionObject != noone) {

    if (nextCollisionObject.solidType == 'ground' && nextCollisionObject.isSlope) {
        var vdir = nextCollisionObject.leftHeight - nextCollisionObject.rightHeight;
        var maxHeight = 0;
        if vdir > 0 {
            maxHeight = nextCollisionObject.leftHeight;
        } else {
            maxHeight = nextCollisionObject.rightHeight;
        }
        move_outside_solid(90, 16);
    } else if (underCollisionObject != noone && nextCollisionObject.solidType == 'ground' && underCollisionObject.isSlope) {
        move_outside_solid(90, 16);
    } else if (place_meeting(x, y, underCollisionObject)) {
        move_outside_solid(90, 16);
    } else {
        move_contact_solid(90 - sign(xSpeed) * 90, xSpeed);
        xSpeed = 0;
    }
    
}

// Decrease speed if char is going to hit floor
if (place_meeting(x, y + ySpeed, par_ground)) {    
    move_contact_solid(270, ySpeed);
    ySpeed = 0;
}
x += xSpeed;



if (place_meeting(x, y + ySpeed, par_ground)) {    
    move_contact_solid(270, ySpeed);
    ySpeed = 0;
}

y += ySpeed;
x += xSpeed;
