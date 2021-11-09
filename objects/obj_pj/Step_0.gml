// Button pressed for directions
top = keyboard_check(ord("Z")) || keyboard_check(vk_up);
down = keyboard_check(ord("S")) || keyboard_check(vk_down);
right = keyboard_check(ord("D")) || keyboard_check(vk_right);
left = keyboard_check(ord("Q")) || keyboard_check(vk_left);

#region Déplacements
if(state == stateId.IDLE) {
	hspeed = 0;
	vspeed = 0;
	
	if(top xor down) {
		if(top)	{
			dir = directionId.BACK;
			hspeed = 0;
			vspeed = -vSpeed;
			state = stateId.WALK;
		} else {
			dir = directionId.FRONT;
			hspeed = 0;
			vspeed = vSpeed;
			state = stateId.WALK;
		}
	}

	if(right xor left) {
		if(right) {
			dir = directionId.RIGHT;
			hspeed = hSpeed;
			vspeed = 0;
			state = stateId.WALK;
		} else {
			dir = directionId.LEFT;
			hspeed = -hSpeed;
			vspeed = 0;
			state = stateId.WALK;
		}
	}
	
	state = stateId.IDLE;
}
#endregion

#region Animations Sprite Player
if(state == stateId.WALK) {
	switch(dir) {
		case directionId.BACK:
			sprite_index = spr_move_back;
			break;
			
		case directionId.FRONT:
			sprite_index = spr_move_front;
			break;
			
		case directionId.RIGHT:
			sprite_index = spr_move_right;
			break;
			
		case directionId.LEFT:
			sprite_index = spr_move_left;
			break;
	}
} else {
	switch(dir) {
		case directionId.BACK:
			sprite_index = spr_idle_back;
			break;
			
		case directionId.FRONT:
			sprite_index = spr_idle_front;
			break;
			
		case directionId.RIGHT:
			sprite_index = spr_idle_right;
			break;
			
		case directionId.LEFT:
			sprite_index = spr_idle_left;
			break;
	}
}
#endregion