/// @description My first event code

// Variables
walkSpeed = 16;
vx = 0;
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
