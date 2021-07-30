/// @description Sorting and other

// Depth, animation
switch (myState) {
	// If item is sitting on the ground
    case itemState.idle:
        depth = -y;
        break;
	case itemState.taken:
		// Keep track of player position
		var _result = itemPosition();
		
		x = _result[0];
		depth = _result[2];
		if (instance_exists(object_player)) {
		    // Animate item being picked up
			if (object_player.myState == playerState.pickingUp) {
			    // Wait until third frame of animation
				if (object_player.image_index >= 2) {
				    if (y > _result[1]) {
						y -= pickUpSpeed;
					}
				}
			}
			// Position item while being carried
			else {
				y = _result[1];
			}
		}
		break;
	// If item is being put back
	case itemState.puttingBack:
		// Animate item being put down
		if (instance_exists(object_player) && object_player.myState == playerState.puttingDown) {
		    if (y < putDownY) {
			    y += putDownSpeed;
			}
			if (y >= putDownY) {
			    myState = itemState.idle;
			}
		}
		break;
}
