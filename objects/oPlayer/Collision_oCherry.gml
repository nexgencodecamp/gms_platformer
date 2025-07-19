// Destroy the cherry
with (other) {
	instance_destroy();	
	audio_play_sound(sndCherryPickup, 10, false);
}

// Update the Player's score
global.score += PICKUP_CHERRY;
show_debug_message("Player Score: " + string(global.score));