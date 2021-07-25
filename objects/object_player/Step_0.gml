/// @description Player movement

// Check keys for movement
if (global.playerControl == true) {
	moveRight = keyboard_check(vk_right);
	moveLeft = keyboard_check(vk_left);
	moveUp = keyboard_check(vk_up);
	moveDown = keyboard_check(vk_down);
}
if (global.playerControl == false) {
	moveRight = 0;
	moveLeft = 0;
	moveUp = 0;
	moveDown = 0;
}

// Run with Shift key
running = keyboard_check(vk_shift);

// Speed up if running
if (running == true) {
    // Ramp up
	if (runSpeed < runMax) {
	    runSpeed += 2;
	}
	show_debug_message("Eso es MONDA");
	// Start creating dust
	if (startDust == 0) {
	    alarm[0] = 2;
		startDust = 1;
	}
}
// Slow down if not longer running
if (running == false) {
    // Ramp down
	if (runSpeed > 0) {
	    runSpeed -= 1;
	}
	startDust = 0;
}

// Calculate movement
vx = ((moveRight - moveLeft) * (walkSpeed + runSpeed) * (1 - carryLimit));
vy = ((moveDown - moveUp) * (walkSpeed + runSpeed) * (1 - carryLimit));

// If idle
if (vx == 0 && vy == 0) {
	// If i'm not picking up or putting down an item
	if (myState != playerState.pickingUp && myState != playerState.puttingDown) {
	    // If I don't have a item
		if (hasItem == noone) {
		    myState = playerState.idle;
		}
		// If I'm carrying an item
		else {
			myState = playerState.carryIdle;
		}
	}
}

// If moving
if (vx != 0 || vy != 0) {
	if !collision_point(x + vx, y, object_parent_enviroment, true, true) {
		x += vx;
	}
	
	if !collision_point(x, y + vy, object_parent_enviroment, true, true) {
		y += vy;
	}

	// Change direction based on movement
	// Right
	if (vx > 0) {
		dir = 0;
	}
	// Left
	if (vx < 0) {
		dir = 2;
	}
	// Down
	if (vy > 0) {
		dir = 3;
	}
	// Up
	if (vy < 0) {
		dir = 1;
	}
	
	// Set state
	// If we don't have an item
	if (hasItem == noone) {
	    myState = playerState.walking;
	}
	else {
	    myState = playerState.carrying;
	}
	// Move audio listener with me
	audio_listener_set_position(0, x, y, 0);
}

// Check for collision with NPCs
nearbyNPC = collision_rectangle(x - lookRange, y - lookRange, x + lookRange, y + lookRange, object_parent_npc, false, true);
if nearbyNPC {
	// Play greeting sound
	if (hasGreeted == false) {
		audio_play_sound(snd_greeting01, 1, false);
		hasGreeted = true;
	}
	// Pop up prompt
	if (npcPrompt == noone || npcPrompt == undefined) {
	    npcPrompt = showPrompt(nearbyNPC, nearbyNPC.x, nearbyNPC.y - 450);
	}
	
	//show_debug_message("object_player has found an NPC!");
}
if !nearbyNPC {
	// Reset greeting
	if (hasGreeted == true) {
		hasGreeted = false;
	}
	// Get rid of prompt
	dismissPrompt(npcPrompt, 0);
	//show_debug_message("object_player hasn't found an NPC!");
}

// Check for collision with Items
nearbyItem = collision_rectangle(x - lookRange, y - lookRange, x + lookRange, y + lookRange, object_parent_item, false, true);
if (nearbyItem && !nearbyNPC) {
	// Pop up prompt
	if (itemPrompt == noone || itemPrompt == undefined) {
		//show_debug_message("object_player has found an item!");
	    itemPrompt = showPrompt(nearbyItem, nearbyItem.x, nearbyItem.y - 300);
	}
}
if (!nearbyItem || nearbyNPC){
	// Get rid of prompt
	dismissPrompt(itemPrompt, 1);
	//show_debug_message("object_player hasn't found an item!");
}

// If picking up an item
if (myState == playerState.pickingUp) {
    if (image_index >= image_number - 1) {
		myState = playerState.carrying;
		global.playerControl = true;
	}
}

// If putting down an item
if (myState == playerState.puttingDown) {
    // Reset weight
	carryLimit = 0;
	// Reset my state once animation finishes
	if (image_index >= image_number - 1) {
	    myState = playerState.idle;
		global.playerControl = true;
	}
}

// Depth sorting
depth = -y;

// Auto-choose Sprite based on state and direction
sprite_index = playerSprite[myState][dir];
