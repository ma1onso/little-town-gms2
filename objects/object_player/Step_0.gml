/// @description Player movement

// Check keys for movement
moveRight = keyboard_check(vk_right);
moveLeft = keyboard_check(vk_left);
moveUp = keyboard_check(vk_up);
moveDown = keyboard_check(vk_down);

// Calculate movement
vx = ((moveRight - moveLeft) * walkSpeed);
vy = ((moveDown - moveUp) * walkSpeed);

// If idle
if (vx == 0 && vy == 0) {
	// Change last sprite based on last direction
	switch dir {
		case 0:
			sprite_index = spr_player_idle_right; break;
		case 1:
			sprite_index = spr_player_idle_up; break;
		case 2:
			sprite_index = spr_player_idle_left; break;
		case 3:
			sprite_index = spr_player_idle_down; break;
	}
}

// If moving
if (vx != 0 || vy != 0) {
	x += vx;
	y += vy;
	
	// Change walking sprite based on direction
	// Right
	if (vx > 0) {
		sprite_index = spr_player_walk_right;
		dir = 0;
	}
	// Left
	if (vx < 0) {
		sprite_index = spr_player_walk_left;
		dir = 2;
	}
	// Down
	if (vy > 0) {
		sprite_index = spr_player_walk_down;
		dir = 3;
	}
	// Up
	if (vy < 0) {
		sprite_index = spr_player_walk_up;
		dir = 1;
	}
}

// Depth sorting
depth = -y;
