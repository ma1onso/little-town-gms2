/// @description Textbox test

var _text, _sequence;

// If player has control
if (global.playerControl == true) {
	// If near an NPC
	if (nearbyNPC) {
		// If NPC is still available
		if (nearbyNPC.myState == npcState.normal) {
		    // If player does not have an item
			if (hasItem == noone || hasItem == undefined) {
			    _text = nearbyNPC.myText;
				if (!instance_exists(object_text_box)) {
					iii = instance_create_depth(nearbyNPC.x, nearbyNPC.y - 400, -10000, object_text_box);
					iii.textToShow = _text;
				}
			}
			// If player has item (and it still exists)
			if (hasItem != noone && instance_exists(hasItem)) {
			    // If player has correct item
				if (hasItem.object_index == nearbyNPC.myItem) {
				    _text = nearbyNPC.itemTextHappy;
					_sequence = nearbyNPC.sequenceHappy;
					// Check if we should remove item, mark NPC
					alarm[1] = 10;
				}
				// Or if player has incorrect item
				else {
					_text = nearbyNPC.itemTextSad;
					_sequence = nearbyNPC.sequenceSad;
				}
				// Create textbox
				if (!instance_exists(object_text_box)) {
				    iii = instance_create_depth(nearbyNPC.x, nearbyNPC.y - 400, -10000, object_text_box);
					iii.textToShow = _text;
					iii.sequenceToShow = _sequence;
				}
			}
		}
		// If NPC is "done"
		if (nearbyNPC.myState == npcState.done) {
		    _text = nearbyNPC.itemTextDone;
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
				myState = itemState.taken;
			}
			// Play picking sound
			audio_play_sound(snd_itemPickup, 1, 0);
		}
	}
	// If not near and NPC or another item
	if (!nearbyItem && !nearbyNPC) {
		// Put down an item
		if (hasItem != noone) {
			myState = playerState.puttingDown;
			image_index = 0;
			global.playerControl = false;
			// Change state of item we were carryng
			with (hasItem) {
			    putDownY = object_player.y + 5;
				myState = itemState.puttingBack;
			}
			// Play put-down sound
			audio_play_sound(snd_itemPutDown, 1, false);
			// Reset item
			hasItem = noone;
		}
	}
}
