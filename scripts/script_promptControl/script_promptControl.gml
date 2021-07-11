/// @function                 function(parameter_one);
/// @param {string}  parameter_one  The message to show
/// @description              Show a message whenever the function is called.
function showPrompt(_object, _x, _y){
	if (instance_exists(_object)) {
	    if (!instance_exists(object_text_box) && !instance_exists(object_prompt)) {
			if (object_player.myState != playerState.puttingDown) {
			    iii = instance_create_depth(_x, _y, -10000, object_prompt);
				return iii
			}
		}
	}
}

function dismissPrompt(_whichPrompt, _toReset){
	if (_whichPrompt != undefined) {
		if (instance_exists(_whichPrompt)) {
			// Tell prompt Object to fade out
			with (_whichPrompt) {
			    fadeMe = "fadeOut";
			}

			// Reset appropiate prompt variable
			if (instance_exists(object_player)) {
				with (object_player) {
				    switch _toReset {
						// Reset npcPrompt
						case 0: npcPrompt = noone; break;
						case 1: itemPrompt = noone; break;
					}
				}  
			}
		}
	}
}