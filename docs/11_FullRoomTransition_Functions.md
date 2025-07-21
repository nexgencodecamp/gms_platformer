## Commit: 11_FullRoomTransition_Functions - Seamlessly Connecting Levels

This commit builds a robust system for moving the player between different rooms or levels. It introduces several new objects and concepts to make the transitions smooth and professional, ensuring the player appears in the correct spot in the next room.

### Key Features

1.  **Persistent Player and Game Manager**: The player and game manager objects now persist between rooms, meaning they don't get destroyed and re-created every time the level changes. This allows them to remember information, like the player's score.
2.  **Room Exits (`oExit`)**: A new object that acts as a doorway to another room. It can be configured to lead to any room in the game.
3.  **Spawn Markers (`oSpawnMarker`)**: An invisible object that tells the game where the player should appear when entering a new room.
4.  **Centralized Transition Logic**: A global function, `transition_to_room()`, is created to handle all the logic for fading out and changing rooms.

---

### Code Breakdown for Beginners

#### `globals.gml` (The New Transition Function)

A powerful new function was added to the global script.

```gml
function transition_to_room(target_room) {
    if (instance_exists(oFadeController)) return; // Don't start a new transition if one is already happening

    var f = instance_create_layer(0, 0, "Instances", oFadeController);
    f.next_room = target_room;
    
    global.transitioned = (target_room != -1); // Set a flag that we are changing rooms, not just restarting
	
	audio_stop_all(); // Stop the current room's music
}
```
*   This function can be called from anywhere. You just tell it which room to go to (`target_room`). It creates the fade controller and sets a global flag so the game knows a transition is happening.

#### `oPlayer` Object (Making it Smarter)

1.  **Persistent Property**: The `oPlayer` object (and `oGameManager`) was marked as **"Persistent"** in the GameMaker editor. This is a simple checkbox that tells the game *not* to destroy this object when a new room loads.

2.  **`Create_0.gml` (New Variables and a Reset Function)**
    *   `spawn_x`, `spawn_y`, `spawn_facing`: These variables are added to remember the player's starting position in a room, so when they die, they respawn there.
    *   `resetPlayer()`: A function is created to reset all the player's stats (health, speed, position) back to their starting values.

3.  **`Room Start` Event (`Other_4.gml`)**
    This is a new event that runs automatically whenever a room starts (or restarts).
    ```gml
    if (global.transitioned) {
        // We came from another room
        resetPlayer();
        var sp = instance_find(oSpawnMarker, 0); // Find the spawn marker in the new room
        x = sp.x;
        y = sp.y;
        // ... update spawn point for this new room ...
        global.transitioned = false; // Clear the flag
    } else {
        // We died and are restarting the same room
        resetPlayer();
    }
    ```
    *   This logic checks the `global.transitioned` flag. If it's true, it knows the player has come from another level and moves them to the `oSpawnMarker`'s position. If it's false, it means the player died, so it just puts them back at the start of the current level.

#### `oExit` Object (The Doorway)

This new object is simple but powerful.
*   **Properties**: It has variables you can set in the room editor, like `target_room` (which room it leads to) and `next_facing` (which way the player should be facing when they arrive).
*   **Collision with Player**: When the player touches an exit, it calls our new `transition_to_room()` function, telling it to go to the `target_room`.

### Summary for Beginners

This commit creates a complete, professional system for moving between levels.
1.  The player touches an **Exit Door (`oExit`)**.
2.  The exit calls the global **`transition_to_room()` function**.
3.  This function creates the **Fade Controller**, which fades the screen to black.
4.  The game loads the **new room**.
5.  Because the **Player is "Persistent"**, it still exists in the new room.
6.  The player's **`Room Start` event** triggers. It sees the `global.transitioned` flag is true, finds the **Spawn Marker (`oSpawnMarker`)** in the new level, and moves itself to that exact spot.
7.  The **Fade Controller** fades the screen back in, and the player is ready to go in the new level, with their score intact.
