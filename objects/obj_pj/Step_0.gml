// Button pressed for directions
top = keyboard_check(ord("Z")) || keyboard_check(vk_up);
down = keyboard_check(ord("S")) || keyboard_check(vk_down);
right = keyboard_check(ord("D")) || keyboard_check(vk_right);
left = keyboard_check(ord("Q")) || keyboard_check(vk_left);

#region Déplacements
if(state == stateId.IDLE) {
	hspeed = 0;
	vspeed = 0;
	
	state = stateId.IDLE;
	scrAnimationsSprites("spr_ch01_idle_", dir);
}

if(top xor down) {
	if(top)	{
		dir = directionId.BACK;
		hspeed = 0;
		vspeed = -vSpeed;
		state = stateId.WALK;
		scrAnimationsSprites("spr_ch01_move_", dir);
	} else if(down) {
		dir = directionId.FRONT;
		hspeed = 0;
		vspeed = vSpeed;
		state = stateId.WALK;
		scrAnimationsSprites("spr_ch01_move_", dir);
	}
} else if (!right && !left) {
	state = stateId.IDLE;	
}

if(right xor left) {
	if(right) {
		dir = directionId.RIGHT;
		hspeed = hSpeed;
		vspeed = 0;
		state = stateId.WALK;
		scrAnimationsSprites("spr_ch01_move_", dir);
	} else if(left) {
		dir = directionId.LEFT;
		hspeed = -hSpeed;
		vspeed = 0;
		state = stateId.WALK;
		scrAnimationsSprites("spr_ch01_move_", dir);
	}
} else if (!top && !down) {
	state = stateId.IDLE;	
}
#endregion