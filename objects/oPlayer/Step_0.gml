// Get keyboard input
var dir = keyboard_check(vk_right) - keyboard_check(vk_left);
var jump = keyboard_check_pressed(vk_space);

// Set horizontal and vertical speed increments for this frame
hsp = walk_speed * dir;
vsp += grv;

// Are we jumping?
if(jump && on_ground) {
	vsp += jump_speed;
	on_ground = false;	
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
if(place_meeting(x+hsp, y, oBlock)) {
	while (!place_meeting(x + sign(hsp), y, oBlock)) {
		x += sign(hsp);
	}
	hsp = 0;
}

// Update vertical movement based on impending collision
if(place_meeting(x, y+vsp, oBlock)){
	while(!place_meeting(x, y + sign(vsp), oBlock)) {
		y += sign(vsp);
	}
	vsp = 0
	on_ground = true;
}

// Finally, set the coordinate (x,y) position of the sprite for this frame
x += hsp;
y += vsp;