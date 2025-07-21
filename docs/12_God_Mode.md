## Commit: 12_God_Mode - Adding a Cheat for Testing

This commit adds a classic developer tool: a "God Mode." This is a cheat that makes the player invincible, which is incredibly useful for testing levels without having to worry about dying.

### Key Features

1.  **God Mode Toggle**: The player can now press the "G" key to turn God Mode on and off.
2.  **Invincibility**: While God Mode is active, the player will no longer die when they touch spikes.
3.  **On-Screen Indicator**: Text appears on the screen to let the player know that God Mode is active.

---

### Code Breakdown for Beginners

#### `globals.gml` (Tracking God Mode State)

A new global variable was added to keep track of whether God Mode is on or off.

```gml
global.god_mode = false;
```
*   This creates a new global flag that starts as `false`. Because it's global, other objects (like the `oGameManager` that draws the text) can easily check its value.

#### `oPlayer` Object Changes

1.  **`Step_0.gml` (Toggling God Mode)**
    ```gml
    if (keyboard_check_pressed(ord("G"))) {
        global.god_mode = !global.god_mode;
        show_debug_message("### GOD MODE: " + string(global.god_mode));
    }
    ```
    *   This code is added at the very top of the player's `Step` event.
    *   `keyboard_check_pressed(ord("G"))`: This checks if the "G" key was just pressed. `ord("G")` is just how the computer understands the "G" key.
    *   `global.god_mode = !global.god_mode;`: This is a clever trick to flip a boolean (true/false) value. The `!` means "not." So, if `global.god_mode` is `false`, it becomes `!false` (which is `true`), and if it's `true`, it becomes `!true` (which is `false`).

2.  **`Collision with oSpike` Event (Implementing Invincibility)**
    The code that handles the player's death was updated with one simple check.
    ```gml
    if (!global.god_mode && !isDead) {
        // ... death sequence code ...
    }
    ```
    *   The death sequence will now only run if `global.god_mode` is `false` AND the player isn't already dead. If God Mode is on, this entire block of code is skipped, and the player simply passes through the spikes unharmed.

#### `oGameManager` Object (`Draw_64.gml`)

The `Draw GUI` event was updated to show the player that God Mode is active.
```gml
if (global.god_mode) {
    draw_set_halign(fa_right);
    draw_text(room_width - 40, 10, "GOD MODE");
}
```
*   This code checks the global flag every frame. If it's `true`, it draws the text "GOD MODE" in the top-right corner of the screen.

### Summary for Beginners

This commit adds a powerful debugging and testing tool. By pressing "G," you can make the player invincible. This allows you to freely explore levels, test jump distances, and check level design without the frustration of repeatedly dying. The on-screen text provides clear feedback that the cheat is active.
