/// @function                            scr_animations_sprites();
/// @description						 choose the spr that has to be played
/// @param  {string}      sprName		 name of the sprite
/// @param  {string}      sprtype		 type of the sprite (move, attack...)
/// @param  {enum number} dir		     direction that is going to be add in the sprName
function scr_animations_sprites() {
	var sprName = argument[0];
	
	// id of state & direction
	var sprType = argument[1];
	var dir = argument[2];
	
	// string for id & direction
	var sprTypeName
	var dirName
	
	// State of the character
	switch(sprType) {
		case 0:
			sprTypeName = "_idle_"
			break;
			
		case 1:
			sprTypeName = "_move_"
			break;
			
		case 2:
			sprTypeName = "_attack_"
			break;
	}
	
	// Direction of the character
	switch(dir) {
		case 0:
			dirName = "front";
			break;
			
		case 1:
			dirName = "back";
			break;
		
		case 2:
			dirName = "right"; 
			break;
			
		case 3:
			dirName = "left";
			break;
			
		default:
			show_debug_message("unexepected movement direction");
			break;
	}
	
	// Returning the right name of the sprite
	sprite_index = asset_get_index(sprName + sprTypeName + dirName);
}