## Commit: 07_Pickups_Sounds_Scores - Adding Collectibles and Feedback

This commit adds some of the most classic and important elements of a platformer game: things to collect, sound effects to make actions feel rewarding, and a score to track the player's progress.

### Key Features

1.  **Cherries (`oCherry`)**: A new collectible object is introduced.
2.  **Scoring**: The player now has a score that increases when they collect a cherry.
3.  **Sound Effects**: A sound now plays when a cherry is collected.

---

### Code Breakdown for Beginners

#### `oPlayer` Object Changes

1.  **`Create_0.gml` (Adding a Score Variable)**
    ```gml
    player_score = 0;
    ```
    *   A new variable, `player_score`, is added to the player object. It's initialized to `0` when the game starts.

2.  **`Collision with oCherry` Event (The Core Logic)**
    A brand new event was added to the player object: the **Collision Event** with `oCherry`. This code runs automatically whenever the player touches a cherry.
    ```gml
    // Destroy the cherry
    with (other) {
        instance_destroy();	
        audio_play_sound(sndCherryPickup, 10, false);
    }

    // Update the Player's score
    player_score += 100;
    show_debug_message("Player Score: " + string(player_score));
    ```
    *   `with (other)`: This is a special block that makes the code inside it apply to the *other* object in the collision (in this case, the cherry).
    *   `instance_destroy()`: This function destroys the cherry instance, making it disappear from the game.
    *   `audio_play_sound(...)`: This plays the new cherry pickup sound effect.
    *   `player_score += 100`: This adds 100 points to the player's score.
    *   `show_debug_message(...)`: This is a temporary line for developers. It prints the player's current score to the output log so we can make sure it's working correctly before we display it on the screen.

### New Assets

*   **`oCherry` (Object) and `sCherry` (Sprite)**: The new collectible cherry object and its animated sprite.
*   **`sndCherryPickup` (Sound)**: The sound effect that plays when a cherry is collected.

### Summary for Beginners

This commit makes the game world more interactive and gives the player a clear goal.
*   You can now **collect cherries** scattered throughout the level.
*   Collecting a cherry makes it disappear, plays a satisfying **sound effect**, and **increases your score**.

This is a classic feedback loop in game design: the player performs an action (collecting), and the game responds with positive feedback (sound, score increase), which makes the action feel rewarding and encourages the player to do it again.
