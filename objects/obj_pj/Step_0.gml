 // Button pressed for directions
top = keyboard_check(ord("Z")) || keyboard_check(vk_up);
down = keyboard_check(ord("S")) || keyboard_check(vk_down);
right = keyboard_check(ord("D")) || keyboard_check(vk_right);
left = keyboard_check(ord("Q")) || keyboard_check(vk_left);
space = keyboard_check(vk_space);

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
	scr_animations_sprites(sprNames, state, dir);
} else if(freeHSpeed < 0) {
	dir = directionId.LEFT;
	state = stateId.WALK;
	scr_animations_sprites(sprNames, state, dir);
}

if(freeVSpeed > 0) {
	dir = directionId.FRONT;
	state = stateId.WALK;
	scr_animations_sprites(sprNames, state, dir);
} else if(freeVSpeed < 0) {
	dir = directionId.BACK;
	state = stateId.WALK;
	scr_animations_sprites(sprNames, state, dir);
}

// IDLE
if(freeHSpeed == 0 && freeVSpeed == 0) {
	state = stateId.IDLE;
	scr_animations_sprites(sprNames, state, dir);
}

#endregion

#region Collisions
// Checking horizontal collision
if(place_meeting(x + freeHSpeed, y, Template_solid)) {
	var currentObjH = instance_place(x + freeHSpeed, y, Template_solid);
	if(sign((currentObjH.x - x)) > 0) {
		collisionXSpeed = (currentObjH.bbox_left - bbox_right) - 2;
	} else {
		collisionXSpeed = (currentObjH.bbox_right - bbox_left) + 2;
	}
	x += collisionXSpeed;
} else {
	x += freeHSpeed;
}

// Checking vertical collision
if(place_meeting(x, y + freeVSpeed, Template_solid)) {
	var currentObjV = instance_place(x, y + freeVSpeed, Template_solid);
	if(sign((currentObjV.y - y)) > 0) {
		collisionYSpeed = (currentObjV.bbox_top - bbox_bottom) - 2;
	} else {
		collisionYSpeed = (currentObjV.bbox_bottom - bbox_top) + 2;
	}
	y += collisionYSpeed;
} else {
	y += freeVSpeed;
}
#endregion

#region Cheat Codes
decreaseSpeed = keyboard_check(ord("A"));
increaseSpeed = keyboard_check(ord("E"));

if(increaseSpeed) {
	hSpeed += 1;
	vSpeed += 1;
}

if(decreaseSpeed) {
	hSpeed -= 1;
	vSpeed -= 1;		
}
#endregion

#region Attack
if(space) {
	var mobCreated = instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_test_mob);
	with(mobCreated) {
		var creator = other.id;
	}
	if(place_meeting(x + 10, y + 10, Template_solid)) {
		show_debug_message(creator.attack[0].dmg);
	}
}
#endregion