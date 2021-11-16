global.cameraX = 0;
global.cameraY = 0;
target = obj_pj;

// Setting camera properties
global.cameraWidth = 680;
global.cameraHeight = 450;
view_enabled = true;
view_visible[0] = true;

camera_set_view_size(view_camera[0], global.cameraWidth, global.cameraHeight);

// Setting Display based on the camera
displayScale = 2;
displayWidth = global.cameraWidth * displayScale;
displayHeight = global.cameraHeight * displayScale;

// Update the scaling
window_set_size(displayWidth, displayHeight);
surface_resize(application_surface, displayWidth, displayHeight);

// To go variables
xTo = global.cameraX;
yTo = global.cameraY;

// Alarm to set window_center()
alarm[0] = 1;