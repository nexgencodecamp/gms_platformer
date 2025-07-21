## Commit: 05_Obstacles - Adding Solid Boxes

This commit introduces a new type of object to the game world: the **Box**. While it might seem simple, this is a fundamental step in making the level more interactive and challenging. The player can stand on boxes and must navigate around them, just like the solid ground blocks.

### Key Changes

1.  **New Object (`oBox`)**: A new object, `oBox`, was created. It uses the `sBox` sprite for its appearance.
2.  **Making Boxes Solid**: The player's code was updated to treat these new boxes as solid objects that can be collided with.

---

### Code Breakdown for Beginners

The changes are straightforward and show how to handle different types of solid objects efficiently.

#### `Create_0.gml` (Defining What's Solid)

A new variable was added to the player's `Create` event to keep track of all the objects that should be treated as solid.

```gml
solid_objects = [oBlock, oBox];
```

*   `solid_objects`: This is an **array**, which is just a list of items. In this case, we're making a list of all the objects the player should not be able to pass through. By putting `oBlock` and the new `oBox` in this list, we can check for collisions against both at the same time.

#### `Step_0.gml` (Checking Collisions with All Solid Objects)

The collision code in the player's `Step` event was updated to use our new `solid_objects` array.

**Old Horizontal Collision Code:**
```gml
if(place_meeting(x+hsp, y, oBlock)) { ... }
```

**New Horizontal Collision Code:**
```gml
if(place_meeting(x+hsp, y, [oBlock, oBox])) { ... } 
// Or even better, using the array:
if(place_meeting(x+hsp, y, solid_objects)) { ... }
```

*   Instead of only checking for collisions with `oBlock`, the code now checks for collisions with *any* of the objects in our `solid_objects` list. The same change was made for the vertical collision check.

This is a great programming practice. If we want to add more solid objects later (like pipes, moving platforms, etc.), we just have to add them to the `solid_objects` list in the `Create` event, and all the collision code will work automatically without needing any other changes.

### New Assets

*   **`sBox` (Sprite)**: The image for the wooden crate.
*   **`oBox` (Object)**: The actual object placed in the room that uses the `sBox` sprite.

### Summary for Beginners

This update adds a new obstacle, the **Box**, to the game. The key takeaway is how the code was organized to handle multiple types of solid objects cleanly. By using an array (`solid_objects`), we've made the collision system expandable and easy to manage, which is a crucial skill for building more complex games.
