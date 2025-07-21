## Commit: 13_Soundtrack_MgrIcons - Adding Music and Improving Organization

This commit brings the game to life with background music and adds a nice organizational touch for the developers in the GameMaker IDE.

### Key Features

1.  **Background Music**: Each room now has its own unique soundtrack that plays on a loop.
2.  **Music Manager (`oMusicManager`)**: A new dedicated object is created to handle playing the correct music for each room.
3.  **IDE Icons**: The invisible "manager" objects (`oGameManager`, `oMusicManager`, `oSpawnMarker`) are given sprites. These sprites are **not visible in the game** but act as helpful icons in the room editor, making it easier for developers to see where these important objects are placed.

---

### Code Breakdown for Beginners

#### `oMusicManager` Object (The DJ of the Game)

This is a new object whose only job is to play music. This is a great example of good organization—keeping different functionalities in separate, dedicated objects.

*   **`Create_0.gml` (Choosing the Right Song)**
    ```gml
    switch (room) {
        case Room1:
            audio_play_sound(sndRoom1_soundtrack, 1, true);
            break;
        case Room2:
            audio_play_sound(sndRoom2_soundtrack, 1, true);
            break;
    }
    ```
    *   This code runs once when the `oMusicManager` is created in a room.
    *   A `switch` statement is like a series of `if` checks. It checks the value of the built-in `room` variable.
    *   If the current room is `Room1`, it plays the `sndRoom1_soundtrack`. If it's `Room2`, it plays the `sndRoom2_soundtrack`.
    *   `audio_play_sound(sound, priority, looping)`: The third argument, `true`, tells the sound to loop forever.

#### `globals.gml` (Stopping the Music)

A small but important line was added to the `transition_to_room()` function.
```gml
function transition_to_room(target_room) {
    // ... fade out logic ...
	
	// Stop soundtrack
	audio_stop_all();
}
```
*   `audio_stop_all()`: This function immediately stops all sounds that are currently playing. This is crucial because when we leave a room, we want its music to stop before the new room's music begins.

#### Manager Icons

The `oGameManager`, `oMusicManager`, and `oSpawnMarker` objects were all assigned new sprites (`spr_GameManager`, etc.). In the object editor, the "Visible" checkbox for these objects was **unchecked**.

*   **Why do this?** These objects don't need to be seen by the player, but they do need to be placed in the room by the developer. Giving them a sprite makes them appear as a clear icon in the room editor, so the developer can easily select, move, and manage them without them being invisible.

### New Assets

*   **`sndRoom1_soundtrack` & `sndRoom2_soundtrack`**: The new music files for the first two rooms.
*   **`oMusicManager`**: The new object to control the music.
*   **`spr_GameManager`, `spr_MusicManager`, `spr_SpawnMarker`**: The new icon sprites for the manager objects.

### Summary for Beginners

This commit adds a layer of polish and atmosphere to the game.
*   Each level now has its own **background music**, making the world feel more immersive.
*   A dedicated **Music Manager** handles this automatically, keeping the code clean.
*   Finally, adding **icons for manager objects** is a quality-of-life improvement for the developer, making the project easier to work with in the GameMaker editor.
