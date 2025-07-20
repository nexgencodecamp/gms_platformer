hsp = 0;							// horizontal speed
vsp = 0;							// vertical speed
terminal_vsp = 8;					// terminal velocity
dir = 0;							// horizontal direction
walk_speed = 2.5;					// walking speed of player
grv = 0.4;							// gravity strength or how far player falls in a single frame
jump_speed = -4;					// number of pixels to jump in a frame
jump_timer = 0;						// number of frames left before we can't hold down the jump button anymore
jump_hold_max = 10;					// how many frames they can hold jump for extra height
jump_count = 0;						// current number of jumps
max_jumps = 2;						// maximum number of jumps allowed
on_ground = false;					// is the player on the ground?
air_accel = 0.5;					// adjust this for responsiveness
air_max = walk_speed;				// limit in-air speed
isDead = false;						// is the player dead or alive?
spawn_x = x;						// where to spawn in the room x
spawn_y = y;						// where to spawn in the room y
spawn_facing = image_xscale;		// usually 1 or -1
player_score = 0;					// player score

solid_objects = [oBlock, oBox, oBlockRoom2];	// array (list) of solid objects

// resetPlayer.gml
function resetPlayer() {
    isDead = false;
    hsp = 0;
    vsp = 0;
    sprite_index = sPlayer_idle;
    image_index = 0;
    image_speed = 1;
    // Reset any other flags, timers, jumps, etc.
    on_ground = false;
    jump_count = 0;
	player_score = 0;
	
    // Reset to stored spawn values
    x = spawn_x;
    y = spawn_y;
    image_xscale = spawn_facing;
}



