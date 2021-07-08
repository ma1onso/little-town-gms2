/// @description Textbox test

var _text;

// If player has control
if (global.playerControl == true) {
	// If near an NPC
	if (nearbyNPC) {
	    // If player does not have an item
		if (hasItem == noone || hasItem == undefined) {
		    _text = nearbyNPC.myText;
			if (!instance_exists(object_text_box)) {
				iii = instance_create_depth(nearbyNPC.x, nearbyNPC.y - 400, -10000, object_text_box);
				iii.textToShow = _text;
			}
		}
	}
	// If near an item
	if (nearbyItem && !nearbyNPC) {
		// If player doesn't have a item
		if (hasItem == noone || hasItem == undefined) {
			global.playerControl = false;
			myState = playerState.pickingUp;
			image_index = 0;
			hasItem = nearbyItem;
			// Take into account weight of the item we're picking up
			carryLimit = hasItem.itemWeight * 0.1;
			// Change state of item we're picking up
			with (hasItem) {
				myState = ItemState.taken;
			}
			// Play picking sound
			audio_play_sound(snd_itemPickup, 1, 0);
		}
	}
}
