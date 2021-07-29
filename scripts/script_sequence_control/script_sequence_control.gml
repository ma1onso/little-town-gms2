// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/// @function                 function(parameter_one);
/// @param {string}  parameter_one  The message to show
/// @description              Show a message whenever the function is called.
function play_sequence(_sequenceToPlay){
	// Create Sequence if appropiate
	if (_sequenceToPlay != noone) {
	    // Set sequence to centre of Camera view
		var _camX = camera_get_view_x(view_camera[0]) + floor(camera_get_view_width(view_camera[0]) * 0.5);
		var _camY = camera_get_view_y(view_camera[0]) + floor(camera_get_view_height(view_camera[0]) * 0.5);
	
		// Make sure our Sequence doesn't already exist
		if (instance_exists(object_control) && !layer_sequence_exists(object_control.currentSequenceLayer, _sequenceToPlay)) {
		    if layer_exists(object_control.currentSequenceLayer) {
				// Create (play) the Sequence
				layer_sequence_create(object_control.currentSequenceLayer, _camX, _camY, _sequenceToPlay);
				// Make sure Custscenes layer is above the action
				layer_depth(object_control.currentSequenceLayer, -10000);
			}
		}
	}
}