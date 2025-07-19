// Get keyboard input
var dir = keyboard_check(vk_right) - keyboard_check(vk_left);
var jump_pressed = keyboard_check_pressed(vk_space);
var jump_held_now = keyboard_check(vk_space); 

// Set horizontal and vertical speed increments for this frame
//hsp = walk_speed * dir;
if (on_ground) {
    hsp = walk_speed * dir; // Normal grounded movement
} else {
    // In air: preserve momentum, but allow some control
    hsp += dir * air_accel;
    hsp = clamp(hsp, -air_max, air_max);
}

// Add gravity each frame because gravity is ALWAYS acting on a player
vsp += grv;

// Are we jumping?
if (jump_pressed && jump_count < max_jumps) {
    vsp = jump_speed;         // usually negative, like -6
    jump_timer = jump_hold_max;
    on_ground = false;
	jump_count++;
}
if (!on_ground && jump_held_now && jump_timer > 0) {
    vsp -= 0.4;               // extra upward force
    jump_timer -= 1;
}

// Set the correct sprite
if(on_ground && hsp == 0){
	sprite_index = sPlayer_idle;
}
else if(!on_ground && vsp < 0) {
	sprite_index = sPlayer_jump;
}
else if(!on_ground && vsp > 0) {
	sprite_index = sPlayer_fall;
}
else if(on_ground){
	if(hsp != 0) {
		sprite_index = sPlayer_run
	}
}

// Update horizontal movement based on impending collision
if (dir!=0){
	image_xscale = dir;
}

var is_going_to_collide_x = place_meeting(x+hsp, y, solid_objects);

if(place_meeting(x+hsp, y, [oBlock, oBox])) {
	while (!place_meeting(x + sign(hsp), y, solid_objects)) {
		x += sign(hsp);
	}
	hsp = 0;
}

// Update vertical movement based on impending collision
if(place_meeting(x, y+vsp, [oBlock, oBox])){
	while(!place_meeting(x, y + sign(vsp), solid_objects)) {
		y += sign(vsp);
	}
	vsp = 0
	on_ground = true;
	jump_count = 0;
}

// Finally, set the coordinate (x,y) position of the sprite for this frame
x += hsp;
y += vsp;