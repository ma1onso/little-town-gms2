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
enum seqState{
	notPlaying,
	waiting,
	playing,
	finished,
}
// Sequence variables
sequenceState = seqState.notPlaying;
currentSequenceLayer = noone;
curentSequence = noone;