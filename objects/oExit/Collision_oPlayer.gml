if (!instance_exists(oFadeController)) {
    // Save the values from this exit so the next room knows what to do
    global.next_facing = next_facing;
    
    // Start the fade-out and set the next room
    transition_to_room(target_room);
}
