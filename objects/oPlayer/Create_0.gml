hsp = 0;							// horizontal speed
vsp = 0;							// vertical speed
dir = 0;							// horizontal direction
walk_speed = 2.5;					// walking speed of player
grv = 0.4;							// gravity strength or how far player falls in a single frame
jump_speed = -4;					// number of pixels to jump in a frame
jump_timer = 0;						// number of frames left before we can't hold down the jump button anymore
jump_hold_max = 10;					// how many frames they can hold jump for extra height
jump_count = 0;						// current number of jumps
max_jumps = 2;						// maximum number of jumps allowed
on_ground = false;					// is the player on the ground?
solid_objects = [oBlock, oBox];		// array (list) of solid object
air_accel = 0.5;					// adjust this for responsiveness
air_max = walk_speed;				// limit in-air speed
player_score = 0;					// current score/points in the game for the player



