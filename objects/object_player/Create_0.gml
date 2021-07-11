/// @description My first event code

// Variables
walkSpeed = 16;
// Velocity of move in x
vx = 0;
// Velocity of move in y
vy = 0;
dir = 3;
moveRight = 0;
moveLeft = 0;
moveUp = 0;
moveDown = 0;
nearbyNPC = noone;
lookRange = 30;
hasGreeted = false;
npcPrompt = noone;
hasItem = noone;
hastItemX = x;
hastItemY = y;
nearbyItem = noone;
itemPrompt = noone;
carryLimit = 0;
myState = playerState.idle;
runSpeed = 0;
runMax = 12;
running = false;
// Is a boolean
startDust = 0;

// Create listener and set orientation
audio_listener_set_position(0, x, y, 0);
audio_listener_set_orientation(0, 0, 1, 0, 0, 0, 1);

// Player Sprite array [myState][dir]
// Idle
playerSprite[playerState.idle][0] = spr_player_idle_right;
playerSprite[playerState.idle][1] = spr_player_idle_up;
playerSprite[playerState.idle][2] = spr_player_idle_left;
playerSprite[playerState.idle][3] = spr_player_idle_down;

// Walking
playerSprite[playerState.walking][0] = spr_player_walk_right;
playerSprite[playerState.walking][1] = spr_player_walk_up;
playerSprite[playerState.walking][2] = spr_player_walk_left;
playerSprite[playerState.walking][3] = spr_player_walk_down;

// Picking up
playerSprite[playerState.pickingUp][0] = spr_player_pickUp_right;
playerSprite[playerState.pickingUp][1] = spr_player_pickUp_up;
playerSprite[playerState.pickingUp][2] = spr_player_pickUp_left;
playerSprite[playerState.pickingUp][3] = spr_player_pickUp_down;

// Carrying
playerSprite[playerState.carrying][0] = spr_player_carry_right;
playerSprite[playerState.carrying][1] = spr_player_carry_up;
playerSprite[playerState.carrying][2] = spr_player_carry_left;
playerSprite[playerState.carrying][3] = spr_player_carry_down;

// Idle while carrying
playerSprite[playerState.carryIdle][0] = spr_player_carryIdle_right;
playerSprite[playerState.carryIdle][1] = spr_player_carryIdle_up;
playerSprite[playerState.carryIdle][2] = spr_player_carryIdle_left;
playerSprite[playerState.carryIdle][3] = spr_player_carryIdle_down;

// Putting down
playerSprite[playerState.puttingDown][0] = spr_player_putDown_right;
playerSprite[playerState.puttingDown][1] = spr_player_putDown_up;
playerSprite[playerState.puttingDown][2] = spr_player_putDown_left;
playerSprite[playerState.puttingDown][3] = spr_player_putDown_down;
