var dir = keyboard_check(vk_right) - keyboard_check(vk_left);
var jump = keyboard_check_pressed(vk_space);
if (dir!=0){
	image_xscale = dir;
}

hsp = walk_speed * dir;
vsp += grv;

if(jump && on_ground) {
	vsp += jump_speed;
	on_ground = false;	
}
else {	
}

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


// horizontal movement
if(place_meeting(x+hsp, y, oBlock)) {
	while (!place_meeting(x + sign(hsp), y, oBlock)) {
		x += sign(hsp);
	}
	hsp = 0;
}

// vertical movement
if(place_meeting(x, y+vsp, oBlock)){
	while(!place_meeting(x, y + sign(vsp), oBlock)) {
		y += sign(vsp);
	}
	vsp = 0
	on_ground = true;
}



x += hsp;
y += vsp;