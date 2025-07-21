## Commit: 09_Debug_Terminal_Velocity - Fine-Tuning Physics

This commit introduces a physics concept called **Terminal Velocity** and adds some helpful debug messages to let the developer "see" the player's speed.

### Key Features

1.  **Terminal Velocity**: The player can no longer accelerate downwards infinitely. Their falling speed is now capped at a maximum value.
2.  **Debug Messages**: The player's horizontal and vertical speeds are now printed to the output console, which is a useful tool for debugging and balancing the game's physics.

---

### Code Breakdown for Beginners

#### `Create_0.gml` (Adding the Terminal Velocity Variable)

A new variable was added to the player's `Create` event to define the maximum falling speed.

```gml
terminal_vsp = 8;
```

*   `terminal_vsp`: This variable holds the maximum speed the player can reach while falling. Without this, gravity would make the player fall faster and faster forever, which can lead to unpredictable behavior and bugs.

#### `Step_0.gml` (Implementing Terminal Velocity and Debugging)

1.  **Capping the Fall Speed:**
    ```gml
    // Make sure vsp never exceeds terminal velocity
    vsp = min(vsp, terminal_vsp);
    ```
    *   This line is the core of the new feature. The `min()` function takes two numbers and returns the smaller one.
    *   If the player's vertical speed (`vsp`) is less than `terminal_vsp` (e.g., 5), it stays as it is.
    *   If gravity accelerates the `vsp` to be greater than `terminal_vsp` (e.g., 9), this line will force it back down to 8. This ensures the player never falls faster than the maximum speed we set.

2.  **Adding Debug Messages:**
    ```gml
    // Debug messages for speed
    if hsp != 0 show_debug_message("hsp: " + string(hsp));
    if vsp != 0 show_debug_message("vsp: " + string(vsp));
    ```
    *   These lines are purely for the developer. They check if the player is moving horizontally or vertically, and if so, they print the current speed values to the output log in GameMaker. This is an invaluable tool for understanding exactly what the code is doing and for fine-tuning variables like `walk_speed`, `grv`, and `jump_speed` to get the game feeling just right.

### Summary for Beginners

This commit is about polishing the game's physics and adding tools for the developer.
*   **Terminal Velocity** makes the player's fall more controlled and realistic, preventing them from reaching ridiculously high speeds.
*   The **Debug Messages** are like a car's speedometer for the developer, showing the exact numbers behind the player's movement so they can make informed decisions when balancing the game.