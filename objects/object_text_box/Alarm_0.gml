/// @description Destroy me and do things

// Return control to player if no Sequence to load
if (sequenceToShow == noone) {
    global.playerControl = true;
}

// Create Sequence if appropiate
if (sequenceToShow != noone) {
    // Set sequence to centre of Camera view
	var _camX = camera_get_view_x(view_camera[0]) + floor(camera_get_view_width(view_camera[0]) * 0.5);
	var _camY = camera_get_view_y(view_camera[0]) + floor(camera_get_view_height(view_camera[0]) * 0.5);
	
	// Make sure our Sequence doesn't already exist
	if (instance_exists(object_control) && !layer_sequence_exists(object_control.currentSequenceLayer, sequenceToShow)) {
	    if layer_exists(object_control.currentSequenceLayer) {
			// Create (play) the Sequence
			layer_sequence_create(object_control.currentSequenceLayer, _camX, _camY, sequenceToShow);
			// Make sure Custscenes layer is above the action
			layer_depth(object_control.currentSequenceLayer, -10000);
		}
	}
}

// Destroy me
instance_destroy();