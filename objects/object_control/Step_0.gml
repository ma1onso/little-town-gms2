/// @description Deal with sequences by state
switch (sequenceState) {
    case sequenceState.playing:
        global.playerControl = false;
        break;
    case sequenceState.finished:
        // Remove Sequence
		if (layer_sequence_exists(currentSequenceLayer, currentSequence)) {
		    layer_sequence_destroy(currentSequence);
		}
		global.playerControl = true;
		sequenceState = sequenceState.notPlaying;
		currentSequence = noone;
        break;
}