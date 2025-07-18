var dir = keyboard_check(vk_right) - keyboard_check(vk_left);
var jump = keyboard_check_pressed(vk_space);

hsp = walk_speed * dir;
vsp += grv;

if(jump && on_ground) {
	vsp += jump_speed;
	on_ground = false;
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