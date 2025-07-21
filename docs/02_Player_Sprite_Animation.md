## Commit: 02_Player_Sprites - Player Sprite Animation

This commit introduces animations for the player character. Here's a breakdown of the changes for a beginner:

### Summary

The main goal of this update was to make the player character look more alive. Instead of being a static image, the player now has different animations depending on what they are doing: standing still (idle), running, jumping, and falling.

### Code Changes (`objects/oPlayer/Step_0.gml`)

This is the file that controls the player's logic every frame. The following was added:

1.  **Flipping the Sprite:**
    ```gml
    if (dir!=0){
        image_xscale = dir;
    }
    ```
    This code checks if the player is moving left (`dir` = -1) or right (`dir` = 1). If they are, it flips the player's sprite horizontally to match the direction of movement. `image_xscale` is a built-in variable that controls the horizontal scale of the sprite. Setting it to -1 flips it.

2.  **Switching Animations:**
    A new block of `if/else if` statements was added to change the player's sprite based on their current action.
    *   `if(on_ground && hsp == 0)`: If the player is on the ground and not moving horizontally (`hsp` is horizontal speed), it sets the sprite to `sPlayer_idle`.
    *   `else if(!on_ground && vsp < 0)`: If the player is in the air and moving upwards (`vsp` is vertical speed), it sets the sprite to `sPlayer_jump`.
    *   `else if(!on_ground && vsp > 0)`: If the player is in the air and moving downwards, it sets the sprite to `sPlayer_fall`.
    *   `else if(on_ground)`: If the player is on the ground and moving (the previous `if` for being idle was false), it sets the sprite to `sPlayer_run`.

### New Assets

To make the animations work, new sprites were created:
*   `sPlayer_idle`: An animation for when the player is standing still.
*   `sPlayer_run`: An animation for when the player is running.
*   `sPlayer_jump`: A sprite for when the player is jumping (moving up).
*   `sPlayer_fall`: A sprite for when the player is falling (moving down).

In simple terms, this commit gives the player character visual life by adding animations that change based on the player's actions, making the game more dynamic and engaging.
