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
		y = _result[1];
		depth = _result[2];
		break;
	// If item is being put back
	case itemState.puttingBack:
		y = putDownY;
		myState = itemState.idle;
		break;
}
