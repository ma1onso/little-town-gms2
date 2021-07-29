/// @description Destroy me and do things

// Return control to player if no Sequence to load
if (sequenceToShow == noone) {
    global.playerControl = true;
}

// Play NPC Sequence
play_sequence(sequenceToShow);

// Destroy me
instance_destroy();