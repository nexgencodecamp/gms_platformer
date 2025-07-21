## Commit: 01_Movement - Basic Player Movement

This is the very first commit of the game, setting up the foundation for everything that comes after. Think of it as building the basic skeleton of our game. It introduces the player character, the solid ground for the player to stand on, and the initial code to make the player move and jump.

### Key Files Created

The most important files for a beginner to understand in this commit are the ones that control the player. In GameMaker, objects have different "events" that hold code. The two we're focusing on are:

*   **`objects/oPlayer/Create_0.gml`**: This code runs only **once** when the player object is first created in the game room. It's used to set up all the starting variables.
*   **`objects/oPlayer/Step_0.gml`**: This is the player's "brain." The code here runs over and over again, once for every single frame of the game. This is where we handle continuous actions like checking for key presses, moving, and applying gravity.

---

### Code Breakdown for Beginners

Let's look at what the code in these two files does, line by line.

#### `Create_0.gml` (Setting Up the Player)

This file initializes the variables that will control our player's physics.

```gml
hsp = 0;
vsp = 0;
dir = 0;
walk_speed = 3;
grv = 0.3;
jump_speed = -8;
on_ground = false;
```

*   `hsp` and `vsp`: These stand for "horizontal speed" and "vertical speed." They start at 0 because the player isn't moving when they first appear.
*   `walk_speed = 3`: This determines how fast the player moves left or right. A higher number means a faster player.
*   `grv = 0.3`: This is our "gravity." In each frame, this value will be added to the vertical speed to pull the player down.
*   `jump_speed = -8`: This is how powerful the player's jump is. In GameMaker, the top of the screen is Y-coordinate 0, and the bottom is a higher number. So, to move up, we need a *negative* vertical speed.
*   `on_ground = false`: This is a simple true/false flag that we'll use to check if the player is currently standing on the ground. This is important so we can prevent the player from jumping in mid-air.

#### `Step_0.gml` (Making the Player Move)

This file does all the heavy lifting every frame.

1.  **Check for Player Input:**
    ```gml
    var dir = keyboard_check(vk_right) - keyboard_check(vk_left);
    var jump = keyboard_check_pressed(vk_space);
    ```
    *   The first line is a clever trick. `keyboard_check` returns `1` if the key is pressed and `0` if it's not. So, if the right arrow is pressed, `dir` becomes `1 - 0 = 1` (move right). If the left arrow is pressed, `dir` becomes `0 - 1 = -1` (move left). If neither or both are pressed, it's `0`.
    *   The second line checks if the spacebar was just pressed in this frame.

2.  **Calculate Speed and Apply Gravity:**
    ```gml
    hsp = walk_speed * dir;
    vsp += grv;
    ```
    *   The horizontal speed is simply our `walk_speed` multiplied by the direction (`-1`, `0`, or `1`).
    *   Gravity is added to the vertical speed, constantly pulling the player down.

3.  **Jumping Logic:**
    ```gml
    if(jump && on_ground) {
        vsp += jump_speed;
        on_ground = false;
    }
    ```
    *   If the jump key was pressed AND the player is on the ground, we give the player a burst of upward speed (our negative `jump_speed`) and set `on_ground` to `false`.

4.  **Collision Detection (The Smart Part):**
    Before actually moving the player, the code checks if a move would cause a collision. This prevents the player from getting stuck in walls.
    *   **Horizontal Collision:**
        ```gml
        if(place_meeting(x+hsp, y, oBlock)) {
            while (!place_meeting(x + sign(hsp), y, oBlock)) {
                x += sign(hsp);
            }
            hsp = 0;
        }
        ```
        This block says: "If I'm *about to* hit a solid block horizontally, don't make the full move. Instead, move me pixel by pixel until I'm right next to the block, and then stop my horizontal speed."
    *   **Vertical Collision:**
        ```gml
        if(place_meeting(x, y+vsp, oBlock)){
            while(!place_meeting(x, y + sign(vsp), oBlock)) {
                y += sign(vsp);
            }
            vsp = 0
            on_ground = true;
        }
        ```
        This does the same for vertical movement. If the player is about to hit the floor, it moves them right up to it, stops their vertical speed, and sets `on_ground` to `true` so they can jump again.

5.  **Final Movement:**
    ```gml
    x += hsp;
    y += vsp;
    ```
    After all the checks and calculations, the player's final `x` and `y` coordinates are updated for this frame.

### Other Files

Many other files were added, including all the game's art assets and configuration files. For a beginner, the most important thing to know is that these files set up the project's structure, define what a "solid block" looks like (`sBlock` and `oBlock`), and create the initial game room (`Room1`) where the player and blocks are placed.
