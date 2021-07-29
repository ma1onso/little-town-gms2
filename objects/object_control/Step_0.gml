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
		
		// Check if NPCs are "done"
		if (global.gameOver == false) {
		    if (instance_exists(object_npc_baker) && instance_exists(object_npc_grocer)&& instance_exists(object_npc_teacher)) {
				if (object_npc_baker.myState == npcState.done && object_npc_grocer.myState == npcState.done && object_npc_teacher.myState == npcState.done) {
				    // Queue up "game over" sequence
					global.playerControl = false;
					alarm[0] = 60;
					// Mark game as won
					global.gameOver = true;
				}
			}
		}
		
        break;
}