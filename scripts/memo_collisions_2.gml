
var heightInTiles = (bbox_bottom - bbox_top) / 16;
var widthInTiles = (bbox_right - bbox_left) / 16;
var xBboxLimit = 0;
var yBboxLimit = 0;
var closestBlock = 0;
var xFacing = 0;
var yFacing = 0;

global.heightInTiles = heightInTiles;
global.widthInTiles = widthInTiles;


if (xSpeed < 0 || (xSpeed == 0 && image_xscale == -1)) {
    xBboxLimit = bbox_left;
    xFacing = 'left';
} else {
    xBboxLimit = bbox_right;
    xFacing = 'right';
}

if (ySpeed < 0) {
    yBboxLimit = bbox_top;
    yFacing = 'top';
} else {
    yBboxLimit = bbox_bottom;
    yFacing = 'bottom';
}

global.xBboxLimit = xBboxLimit;
global.yBboxLimit = yBboxLimit;
global.xFacing = xFacing;

for (var i = 0; i < heightInTiles; i++) {
    
    /*var tempObject = instance_place(xBboxLimit + sign(xSpeed), bbox_top + 8 + (16 * i), par_solid);
    global.tempObject = tempObject;
    if (tempObject != noone) {
        if ((xFacing == 'left' && (closestBlock == 0 || tempObject.bbox_right > closestBlock.bbox_right) && tempObject.bbox_right < xBboxLimit)
            || (xFacing == 'right' && (closestBlock == 0 || tempObject.bbox_left < closestBlock.bbox_left) && tempObject.bbox_left > xBboxLimit)) {
            closestBlock = tempObject;
        }
    } */
    
    var x1;
    var x2;
    var y1;
    var y2;
    var searchedZoneWidth;
    
    if (xFacing == 'left') {
        searchedZoneWidth = xBboxLimit / 16;
    } else {
        searchedZoneWidth = (xBboxLimit - view_wview[0]) / 16;
    }
    
    if (yFacing == 'top') {
        y1 = yBboxLimit + (i * 16);
    } else {
        y1 = yBboxLimit - ((i + 1) * 16);
    }
    
    y2 = y1 + 16;
    
    global.searchedZoneWidth = searchedZoneWidth;
    for (var j = 0; j < searchedZoneWidth; j++) {
        var inst;
        if (xFacing == 'left') {
            /*inst = collision_rectangle(x2 - ((j + 1) * 16), y1, x2, y2, par_solid, false, false);
            if (inst != noone) {
                with (inst) {
                    if ((closestBlock == 0 || bbox_right > closestBlock.bbox_right) && bbox_right < xBboxLimit) {
                        closestBlock = id;
                    }
                    
                }
            }*/
            x1 = xBboxLimit - ((j + 1) * 16);
        } else {
            /*inst = collision_rectangle(x1, y1, (x1 + ((j + 1) * 16)), y2, par_solid, false, false);
            if (inst != noone) {
                with (inst) {
                    if ((closestBlock == 0 || bbox_left < closestBlock.bbox_left) && bbox_left > xBboxLimit) {
                        closestBlock = id;
                    }
                    
                }
            }*/
            x1 = xBboxLimit + (j * 16);
        }
        x2 = x1 + 16;
        inst = collision_rectangle(x1, y1, x2, y2, par_solid, false, true);
        if (inst != noone
            && (closestBlock == 0
                || (xFacing == 'left' && inst.bbox_right > closestBlock.bbox_right) 
                || (xFacing == 'right' && inst.bbox_left < closestBlock.bbox_left))
            ) {
            closestBlock = inst;
            break;
        }
        
    }
}


if (closestBlock != 0) {
    if (xFacing == 'left') {
        x += max(xSpeed, closestBlock.bbox_right - xBboxLimit + 1);
        global.closestBlockX = closestBlock.bbox_right;
    } else {
        x += min(xSpeed, closestBlock.bbox_left - xBboxLimit - 1);
        global.closestBlockX = closestBlock.bbox_left;
    }
} else {
    x += xSpeed;
}

global.closestBlock = closestBlock;
global.xspeed = xSpeed;
global.yspeed = ySpeed;


if (place_meeting(x, y + ySpeed, par_ground)) {    
    move_contact_solid(270, ySpeed);
    ySpeed = 0;
}

y += ySpeed;

