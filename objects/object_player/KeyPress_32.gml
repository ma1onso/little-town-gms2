/// @description Textbox test

var _text;

// Create a textbox if NPC is nearby
if (nearbyNPC && global.playerControl == true) {
	_text = nearbyNPC.myText;
	
	if (!instance_exists(object_text_box)) {
		iii = instance_create_depth(x, y, -100000, object_text_box);
		iii.textToShow = _text;
	}
}