// GLOBAL VARIABLES & CONSTANTS
#macro PICKUP_CHERRY	100
#macro SCORE_NUM_ZEROS	6

///////////////////////////
global.god_mode = false;		// Can set God mode and avoid death
global.next_facing = 1;			// Facing left or right when moving to next room
global.transitioned = false 	// Flag to signal RoomStart to reposition the player

// FUNCTIONS
function transition_to_room(target_room) {
    // Avoid triggering multiple transitions at once
    if (instance_exists(oFadeController)) return;

    var f = instance_create_layer(0, 0, "Instances", oFadeController);
    f.next_room = target_room;
    f.fade_alpha = 0;
    f.fade_speed = 0.05;
    f.fading_out = true;
	
    global.transitioned = (target_room != -1);
	
	// Stop soundtrack
	audio_stop_all()
}