// Only run this if transitioning (i.e., not restarting)
if (global.transitioned) {
    resetPlayer();

    var sp = instance_find(oSpawnMarker, 0);
    if (instance_exists(sp)) {
        x = sp.x;
        y = sp.y;
        image_xscale = global.next_facing;
		
		// Update player's spawn point for this room
        spawn_x = x;
        spawn_y = y;
        spawn_facing = image_xscale;
    }

    global.transitioned = false; // Clear flag after applying
}
else {
	resetPlayer();
}

