/// @description Deal with dust

// Create dust cloud
var _dustX, _dustY;
_dustX = object_player.x - (vx * 4);
_dustY = irandom_range(object_player.y - 10, object_player.y + 10);
if (running == true) {
	show_debug_message("asdasd");
	// Create dust clouds only if moving
	if (vx != 0 || vy != 0) {
	    instance_create_depth(_dustX, _dustY, depth + 2, object_dust);
	}
	//Reset alarm
	alarm[0] = 8 + (1 + carryLimit);
}