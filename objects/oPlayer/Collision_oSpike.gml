if (!global.god_mode && !isDead) {
	isDead = true;
	sprite_index = sPlayer_hit;
	image_index = 0;
	image_speed = 0;
	audio_play_sound(sndDie, 10, false);
	alarm[0] = 60;
}