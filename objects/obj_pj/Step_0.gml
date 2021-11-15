 // Button pressed for directions
top = keyboard_check(ord("Z")) || keyboard_check(vk_up);
down = keyboard_check(ord("S")) || keyboard_check(vk_down);
right = keyboard_check(ord("D")) || keyboard_check(vk_right);
left = keyboard_check(ord("Q")) || keyboard_check(vk_left);

var freeHSpeed = 0;
var freeVSpeed = 0;

var collisionXSpeed = 0;
var collisionYSpeed = 0;

#region Moves
// Direction movements
freeVSpeed = vSpeed * (down - top);
freeHSpeed = hSpeed * (right - left);

if(freeHSpeed > 0) {
	dir = directionId.RIGHT;
	state = stateId.WALK;
	scrAnimationsSprites("spr_ch01_move_", dir);
} else if(freeHSpeed < 0) {
	dir = directionId.LEFT;
	state = stateId.WALK;
	scrAnimationsSprites("spr_ch01_move_", dir);
}

if(freeVSpeed > 0) {
	dir = directionId.FRONT;
	state = stateId.WALK;
	scrAnimationsSprites("spr_ch01_move_", dir);
} else if(freeVSpeed < 0) {
	dir = directionId.BACK;
	state = stateId.WALK;
	scrAnimationsSprites("spr_ch01_move_", dir);
}

// IDLE
if(freeHSpeed == 0 && freeVSpeed == 0) {
	state = stateId.IDLE;
	scrAnimationsSprites("spr_ch01_idle_", dir);
}

#endregion

#region Collisions
// Checking horizontal collision
if(place_meeting(x + freeHSpeed, y, Template_mobs)) {
	if(sign((Template_mobs.x - x)) > 0) {
		collisionXSpeed = (Template_mobs.bbox_left - bbox_right) - 1;
	} else {
		collisionXSpeed = (Template_mobs.bbox_right - bbox_left) + 1;
	}
	x += collisionXSpeed;
} else {
	x += freeHSpeed;
}

// Checking vertical collision
if(place_meeting(x, y + freeVSpeed, Template_mobs)) {
	if(sign((Template_mobs.y - y)) > 0){
		collisionYSpeed = (Template_mobs.bbox_top - bbox_bottom) - 1;
	} else {
		collisionYSpeed = (Template_mobs.bbox_bottom - bbox_top) + 1;
	}
	y += collisionYSpeed;
} else {
	y += freeVSpeed;
}
#endregion