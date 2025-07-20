if (fading_out) {
    fade_alpha += fade_speed;
    if (fade_alpha >= 1) {
        fade_alpha = 1;

        // Now switch rooms
        if (next_room == -1) {
            room_restart();
        } else {
			global.transitioned = true;
            room_goto(next_room);
        }

        fading_out = false; // Begin fading back in after restart
    }
} else {
    fade_alpha -= fade_speed;
    if (fade_alpha <= 0) {
        instance_destroy(); // Done
    }
}
