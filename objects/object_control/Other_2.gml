/// @description Game variables

// Game variables
global.playerControl = true;

// Player states
enum playerState {
	idle, walking, pickingUp, carrying, carryIdle, puttingDown,
}

// Item states
enum ItemState {
	idle, taken, used, puttingBack,
}