/// @description Test sequence

// Set sequence to centre of Camera view
var _camX = camera_get_view_x(view_camera[0]) + floor(camera_get_view_width(view_camera[0]) * 0.5);
var _camY = camera_get_view_y(view_camera[0]) + floor(camera_get_view_height(view_camera[0]) * 0.5);

// Create Sequence on the proper layer
if !(layer_sequence_exists(currentSequenceLayer, sequence_baker_happy)) {
	if (layer_exists(currentSequenceLayer)) {
		layer_sequence_create(currentSequenceLayer, _camX, _camY, sequence_baker_happy);
		// Make sure Cutscenes layer is above the action
		layer_depth(currentSequenceLayer, -10000);
	}
}
