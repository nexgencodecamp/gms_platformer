## Commit: 10_Spikes_Die_Transition - Adding Hazards and a Death Sequence

This commit introduces a major gameplay element: **danger**. Spikes are added to the level, and for the first time, the player can "die." This commit also creates a smooth screen-fade transition for when the player dies and the level restarts.

### Key Features

1.  **Spikes (`oSpike`)**: A new hazardous object that will kill the player on contact.
2.  **Death State**: The player now has a "dead" state to prevent them from moving after being hit.
3.  **Death Animation and Sound**: When the player dies, they play a "hit" animation and a death sound effect.
4.  **Fade-to-Black Transition**: A new controller object (`oFadeController`) is created to smoothly fade the screen to black before restarting the room.

---

### Code Breakdown for Beginners

#### `oPlayer` Object Changes

1.  **`Create_0.gml` (New "isDead" Flag)**
    ```gml
    isDead = false;
    ```
    *   A new variable, `isDead`, is added. This is a simple true/false flag that we'll use to track if the player is currently alive or dead.

2.  **`Step_0.gml` (Stopping Player Movement on Death)**
    ```gml
    if (isDead) exit;
    ```
    *   This line is added right at the beginning of the `Step` event. `exit` immediately stops running any more code in the event. This is a simple and effective way to freeze the player in place as soon as they die.

3.  **`Collision with oSpike` Event (The Death Logic)**
    This is the core of the new feature. This code runs when the player touches a spike.
    ```gml
    if (!isDead) {
        isDead = true;
        sprite_index = sPlayer_hit;
        image_index = 0;
        image_speed = 0;
        audio_play_sound(sndDie, 10, false);
        alarm[0] = 60;
    }
    ```
    *   `if (!isDead)`: This check is important to make sure the death sequence only runs once.
    *   `isDead = true;`: The player is now officially dead.
    *   `sprite_index = sPlayer_hit;`: The player's sprite is changed to the new "hit" animation.
    *   `image_index = 0; image_speed = 0;`: These lines freeze the animation on its first frame.
    *   `audio_play_sound(...)`: Plays the death sound effect.
    *   `alarm[0] = 60;`: This is a crucial part. It sets **Alarm 0** to run after 60 frames (which is 1 second in a 60 FPS game).

4.  **`Alarm 0` Event (Triggering the Restart)**
    This new event runs exactly 60 frames after the player dies.
    ```gml
    var f = instance_create_layer(0, 0, "Instances", oFadeController);
    f.next_room = -1;
    ```
    *   This code creates our new `oFadeController` object, which will handle the screen fade. Setting `next_room` to `-1` tells the controller to restart the current room.

#### `oFadeController` Object (The Transition Manager)

This new object is dedicated to handling screen transitions.
*   **`Create` Event**: It initializes variables for the fade's transparency (`fade_alpha`) and speed.
*   **`Step` Event**: This is where the magic happens. It gradually increases `fade_alpha` from 0 (clear) to 1 (fully black). Once the screen is black, it restarts the room and then fades back in by decreasing the alpha. When it's fully faded in, the controller destroys itself.
*   **`Draw GUI` Event**: This draws a black rectangle over the entire screen, using `fade_alpha` to control its transparency.

### Summary for Beginners

This commit adds a complete "death cycle" to the game.
1.  The player touches a **spike**.
2.  The player enters a **dead state**, plays a hit animation and sound, and can no longer move.
3.  An **alarm** is set.
4.  After one second, the alarm triggers a **fade-to-black** transition.
5.  Once the screen is black, the **room restarts**, putting the player back at the beginning, ready to try again.
