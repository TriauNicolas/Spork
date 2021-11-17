enum directionId {
	FRONT = 0,
	BACK = 1,
	
	RIGHT = 2,
	LEFT = 3
};

enum stateId {
	IDLE = 0,
	WALK = 1,
	ATTACK = 2
};

hSpeed = 3;
vSpeed = 3;

dir = directionId.FRONT;

state = stateId.IDLE;

sprNames = "spr_ch01";

attack = [
	{
		name: "attack de base",
		dmg: 10,
		type: "neutre"
	}
];