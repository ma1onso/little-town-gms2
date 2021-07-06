/// @description Game variables

// Game variables
global.playerControl = true;

// Player states
enum playerState {
	idle, walking, pickingUp, carryng, carryIdle, puttingDown,
}

// Item states
enum ItemState {
	idle, taken, used, puttingBack,
}