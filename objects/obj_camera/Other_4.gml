global.cameraX = 0;
global.cameraY = 0;
target = obj_pj;

// Setting camera properties
cameraWidth = 680;
cameraHeight = 450;
view_enabled = true;
view_visible[0] = true;

camera_set_view_size(view_camera[0], cameraWidth, cameraHeight);

// Setting Display based on the camera
displayScale = 2;
displayWidth = cameraWidth * displayScale;
displayHeight = cameraHeight * displayScale;

// Update the scaling
window_set_size(displayWidth, displayHeight);
surface_resize(application_surface, displayWidth, displayHeight);

// To go variables
xTo = global.cameraX;
yTo = global.cameraY;

// Alarm to set window_center()
alarm[0] = 1;