// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/// @function                 function(parameter_one);
/// @param {string}  parameter_one  The message to show
/// @description              Show a message whenever the function is called.
function itemPosition(){
	var _x, _y, _depth;
	if (instance_exists(object_player)) {
	    switch (object_player.dir) {
		    case 0:
		        // right
				_x = object_player.x + 65;
				_y = object_player.y - 112;
				_depth = object_player.depth - 2;
		        break;
		    case 1:
		        // up
				_x = object_player.x;
				_y = object_player.y - 95;
				_depth = object_player.depth + 2;
		        break;
			case 2:
				// Left
				_x = object_player.x - 65;
				_y = object_player.y - 112;
				_depth = object_player.depth - 2;
				break;
			case 3:
				// down
				_x = object_player.x;
				_y = object_player.y - 95;
				_depth = object_player.depth - 2;
				break;		
		}
		return [_x, _y, _depth];
	}
}