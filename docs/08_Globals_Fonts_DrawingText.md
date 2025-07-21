## Commit: 08_Globals_Fonts_DrawingText - Displaying the Score

This commit builds directly on the last one. We had a scoring system, but the player couldn't see their score! This update focuses on creating a **Heads-Up Display (HUD)** to show the score on the screen. It also introduces a more advanced way to handle variables: **global variables**.

### Key Features

1.  **Global Variables**: The score is moved from a regular variable to a `global` one, making it accessible from anywhere in the game.
2.  **Custom Font**: A new pixel-art font is added to the game for displaying the score in a style that matches the graphics.
3.  **Drawing to the Screen**: Code is added to a manager object to draw the score text to the screen every frame.

---

### Code Breakdown for Beginners

#### `scripts/globals.gml` (A Central Place for Important Variables)

This is a new and very important type of asset: a **Script**. In GameMaker, scripts are used to store functions or, in this case, to declare variables that need to be accessed from anywhere in the game.

```gml
// GLOBAL VARIABLES & CONSTANTS
#macro PICKUP_CHERRY	100
#macro SCORE_NUM_ZEROS	6

///////////////////////////
global.score = 0;
```

*   `#macro`: This is a way to create a **constant**. Think of it as giving a nickname to a value. Now, instead of typing `100` every time we want to give points for a cherry, we can just type `PICKUP_CHERRY`. If we later decide cherries should be worth 150 points, we only have to change it in this one place!
*   `global.score = 0`: This creates a **global variable**. By putting `global.` in front of `score`, we are making it accessible from any object at any time. This is much better than storing the score on the player object, especially as the game gets more complex.

#### `oPlayer` Object Changes

The player's code was updated to use the new global score.

*   **`Create_0.gml`**: The line `player_score = 0;` was **removed**. The score is now handled by the `globals` script.
*   **`Collision_oCherry.gml`**: The line `player_score += 100;` was changed to `global.score += PICKUP_CHerry;`.

#### `oGameManager` Object Changes

This object is now responsible for drawing the HUD.

*   **`Draw GUI` Event (`Draw_64.gml`)**: A new event was added to the Game Manager. The `Draw GUI` event is special because it draws things on a layer that is separate from the game world. This means the score will stay fixed in the top-left corner of the screen, even when the camera follows the player.

    ```gml
    draw_set_font(fnt_score);
    draw_set_color(make_colour_rgb(255, 75, 172));
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_text(40, 5, "SCORE: " + string_repeat("0", 6 - string_length(string(global.score))) + string(global.score));
    ```
    1.  It sets the font to our new pixel art font (`fnt_score`).
    2.  It sets the draw color to a nice pink.
    3.  It aligns the text to the top-left.
    4.  The `draw_text` line is a bit complex, but it does something cool: it draws the word "SCORE: " followed by the player's score, padded with leading zeros (e.g., "000100" instead of "100").

### Summary for Beginners

This commit creates the game's first piece of user interface (UI).
*   The score is now managed by a **global variable**, which is a best practice for data that needs to be accessed everywhere.
*   A custom **font** was added to make the text match the game's art style.
*   The **score is now visible on the screen** during gameplay, giving the player constant feedback on their progress.
