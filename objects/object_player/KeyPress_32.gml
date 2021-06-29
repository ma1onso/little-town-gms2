/// @description Textbox test

// Create a textbox
if (nearbyNPC) {
	if (!instance_exists(object_text_box)) {
		instance_create_depth(x, y, -100000, object_text_box);
	}
}