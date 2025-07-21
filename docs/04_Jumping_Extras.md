## Commit: 04_Jumping_Extras - Advanced Jumping Mechanics

This commit makes the player's jump feel much more dynamic and skillful. Instead of a single, fixed jump, two new features were added: **Double Jumping** and **Variable Jump Height**. This gives the player more control in the air.

### Code Changes

The changes were made in the player's `Create` and `Step` events.

#### `Create_0.gml` (Setting Up New Jump Variables)

New variables were added to keep track of the new jump states.

```gml
grv = 0.4;
jump_speed = -5;
jump_timer = 0;
jump_hold_max = 10;
jump_count = 0;
max_jumps = 2;
```

*   `grv` and `jump_speed` were tweaked slightly to feel better with the new mechanics.
*   `jump_timer` and `jump_hold_max`: These control the **variable jump height**. The player can hold the jump button for up to 10 frames to get a little extra boost.
*   `jump_count` and `max_jumps`: These control the **double jump**. The player is allowed a maximum of 2 jumps before they have to touch the ground again.

#### `Step_0.gml` (Implementing the New Logic)

The core logic in the `Step` event was updated to handle these new mechanics.

1.  **Reading More Input:**
    ```gml
    var jump_pressed = keyboard_check_pressed(vk_space);
    var jump_held_now = keyboard_check(vk_space); 
    ```
    *   The code now checks for two things: if the jump button was *just pressed* (`jump_pressed`) and if it's *currently being held down* (`jump_held_now`).

2.  **The New Jump Logic:**
    ```gml
    // Double Jump Logic
    if (jump_pressed && jump_count < max_jumps) {
        vsp = jump_speed;
        jump_timer = jump_hold_max;
        on_ground = false;
        jump_count++;
    }
    
    // Variable Jump Height Logic
    if (!on_ground && jump_held_now && jump_timer > 0) {
        vsp -= 0.5; // extra upward force
        jump_timer -= 1;
    }
    ```
    *   The first `if` statement now allows a jump as long as the `jump_count` is less than `max_jumps` (2). Each time the player jumps, `jump_count` goes up by one.
    *   The second `if` statement gives the player a small upward boost (`vsp -= 0.5`) for every frame they hold down the jump button, but only for a maximum of 10 frames (`jump_timer`).

3.  **Resetting the Jumps:**
    ```gml
    if(place_meeting(x, y+vsp, oBlock)){
        // ... collision code ...
        on_ground = true;
        jump_count = 0; // Reset jump counter
    }
    ```
    *   Crucially, whenever the player lands on the ground, the `jump_count` is reset back to `0`, allowing them to double jump all over again.

### Summary for Beginners

Think of this update as giving the player more tools for navigating the world.
*   **Double Jump:** You can now press the jump button a second time while in the air to get another boost. This is essential for clearing larger gaps.
*   **Variable Jump:** Tapping the jump button gives you a small hop, while holding it down gives you a higher, more powerful jump.

These two features are staples of the platformer genre and make controlling the character feel much more fluid and satisfying.
