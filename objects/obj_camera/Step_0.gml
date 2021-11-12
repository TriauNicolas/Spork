// Smooth transition to move the camera where the player goes
global.cameraX += (xTo - global.cameraX) / 5;
global.cameraY += (yTo - global.cameraY) / 5;

if(instance_exists(target)) {
	xTo = target.x - (cameraWidth / 2);
	yTo = target.y - (cameraHeight / 2);
}

camera_set_view_pos(view_camera[0], global.cameraX, global.cameraY)