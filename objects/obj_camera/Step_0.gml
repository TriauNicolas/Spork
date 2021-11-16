// Smooth transition to move the camera where the player goes
global.cameraX += (xTo - global.cameraX) / 5;
global.cameraY += (yTo - global.cameraY) / 5;

if(instance_exists(target)) {
	xTo = target.x - (global.cameraWidth / 2);
	yTo = target.y - (global.cameraHeight / 2);
	
	global.cameraX = clamp(global.cameraX, 0, room_width - global.cameraWidth);
	global.cameraY = clamp(global.cameraY, 0, room_height - global.cameraHeight);
}

camera_set_view_pos(view_camera[0], global.cameraX, global.cameraY);