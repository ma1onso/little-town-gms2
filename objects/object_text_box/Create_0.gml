/// @description Variables and setup

// Textbox variables
textToShow = "A complete setence from my code source";
textWidth = 450;
lineHeight = 28;
fadeMe = 0;
fadeSpeed = 0.1;
image_alpha = 0;

global.playerControl = false;

// Play UI sound
audio_play_sound(snd_pop01, 1, false);

// Dismiss any visible prompts
dismissPrompt(object_prompt, 0);
