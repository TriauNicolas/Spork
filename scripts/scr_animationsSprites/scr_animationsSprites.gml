// Commentaire à faire
function scrAnimationsSprites() {
	var sprName = argument[0];
	var dir = argument[1];
	var dirName
	
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
	
	show_debug_message(sprName + dirName)
	sprite_index = asset_get_index(sprName + dirName);
}