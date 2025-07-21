## Commit: 03_Comments - Adding Explanations to Code

This commit is a small but very important one for making our game easier to understand and work on in the future. No new features were added. Instead, the focus was entirely on **commenting the code**.

### What Are Comments?

In programming, comments are lines of text that the computer completely ignores. They are written purely for humans to read. You can spot them in GameMaker Language (GML) because they start with `//`.

Good comments explain the *why* behind a piece of code, not just the *what*. They act like little notes to yourself or to other programmers to make the logic clearer.

### Code Changes (`objects/oPlayer/Step_0.gml`)

The only file changed in this commit was the player's `Step` event, which contains all the logic for movement and animation. Let's look at the new comments that were added.

```gml
// Get keyboard input
var dir = keyboard_check(vk_right) - keyboard_check(vk_left);
var jump = keyboard_check_pressed(vk_space);

// Set horizontal and vertical speed increments for this frame
hsp = walk_speed * dir;
vsp += grv;

// Are we jumping?
if(jump && on_ground) {
	vsp += jump_speed;
	on_ground = false;	
}

// Set the correct sprite
if(on_ground && hsp == 0){
    // ... code to set idle sprite ...
}
// ... other sprite logic ...

// Update horizontal movement based on impending collision
if (dir!=0){
	image_xscale = dir;
}
if(place_meeting(x+hsp, y, oBlock)) {
    // ... collision code ...
}

// Update vertical movement based on impending collision
if(place_meeting(x, y+vsp, oBlock)){
    // ... collision code ...
}

// Finally, set the coordinate (x,y) position of the sprite for this frame
x += hsp;
y += vsp;
```

As you can see, the code itself didn't change. The new `//` lines simply break the `Step` event down into logical sections:
1.  Getting player input.
2.  Calculating speed and gravity.
3.  Handling the jump.
4.  Choosing the right animation.
5.  Dealing with collisions.
6.  Applying the final movement.

This makes the code much more readable. Now, if you come back to this file weeks later, you can quickly understand the purpose of each block of code without having to re-read and decipher every single line. This is a fundamental practice in good coding!
