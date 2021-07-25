/// @description Game variables

// Game variables
global.playerControl = true;

// Player states
enum playerState {
	idle, walking, pickingUp, carrying, carryIdle, puttingDown,
}

// Item states
enum itemState {
	idle, taken, used, puttingBack,
}

// Sequence states
enum sequenceState{
	notPlaying,
	waiting,
	playing,
	finished,
}
// Sequence variables
sequenceState = sequenceState.notPlaying;
currentSequenceLayer = noone;
currentSequence = noone;