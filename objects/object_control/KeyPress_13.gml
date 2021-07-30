/// @description Proceed to gameplay

if (room == room_mainTitle) {
    if (global.gameStart == false) {
	    audio_stop_all();
		global.gameStart = true;
		room_goto(room_game_main);
	}
}