/// @description Deal with sequences

// Listen for Broadcast Mesages
switch (event_data[? "message"]) {
    case "sequenceStart":
        // Set our state
		sequenceState = sequenceState.playing;
		// Find out which Sequence just broadcast this message and mark it
		if (layer_get_element_type(event_data[? "element_id"]) == layerelementtype_sequence) {
		    currentSequence = event_data[? "element_id"];
			show_debug_message("obj_control has heard tha Sequence " + string(currentSequence) + " is playing");
		}
        break;
    case "sequenceEnd": {
		sequenceState = sequenceState.finished;
		show_debug_message("obj_control has heard that Sequence" + string(currentSequence) + " has endend");
		break;
	}
}