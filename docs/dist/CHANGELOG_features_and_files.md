# Integrated Changelog and File Updates

This document integrates high-level updates with the associated file-level changes, providing clear cross-reference for each development stage of the platformer game.

---

### **1. Basic Player Movement**

This was the first step in creating the game. It laid the foundation for the player's existence and their ability to interact with the world.

**What was added:**
- A player character that can move left and right.
- A basic jumping mechanic.
- Solid blocks for the player to stand on.

**File changes:**
- **A** `.gitattributes`
- **A** `.gitignore`
- **A** `objects/oGameManager/Create_0.gml`
- **A** `objects/oPlayer/Create_0.gml`
- **A** `objects/oPlayer/Step_0.gml`
- **A** `platformer_01.yyp`

**Key takeaway:** The core code for player input and physics was established.

---

### **2. Player Sprite Animation**

This update gave the player character a visual personality with animations.

**What was added:**
- Animations for idle, running, jumping, and falling.
- Automatic animation switching based on actions.
- Sprite flipping based on direction.

**File changes:**
- **M** `objects/oPlayer/Step_0.gml`

**Key takeaway:** The game became visually dynamic and responsive.

---

### **3. Code Comments**

A quality-of-life update for developers.

**What was added:**
- Detailed comments in player code.

**File changes:**
- **M** `objects/oPlayer/Step_0.gml`

**Key takeaway:** Improved readability and maintainability.

---

### **4. Advanced Jumping Mechanics**

Enhanced jumping mechanics for improved player control.

**What was added:**
- Double jump capability.
- Variable jump height based on button press duration.

**File changes:**
- **M** `objects/oPlayer/Create_0.gml`
- **M** `objects/oPlayer/Step_0.gml`

**Key takeaway:** Essential platformer mechanics added for fluid navigation.

---

### **5. Obstacles**

Introduction of interactive game objects.

**What was added:**
- Solid navigable boxes.
- Improved collision handling.

**File changes:**
- **M** `objects/oPlayer/Create_0.gml`
- **M** `objects/oPlayer/Step_0.gml`

**Key takeaway:** Enabled complex and challenging level design.

---

### **6. Gameplay Tweaks**

Refined player movement and physics.

**What was added:**
- Air control for horizontal movement in air.
- Balanced physics variables.

**File changes:**
- **M** `objects/oPlayer/Create_0.gml`
- **M** `objects/oPlayer/Step_0.gml`

**Key takeaway:** Improved overall game feel and character control.

---

### **7. Pickups, Sound, and Score**

Addition of collectibles and feedback systems.

**What was added:**
- Collectible cherries.
- Scoring system.
- Pickup sound effects.

**File changes:**
- **A** `objects/oPlayer/Collision_oCherry.gml`
- **M** `objects/oPlayer/Create_0.gml`
- **A** `sounds/sndCherryPickup/sndCherryPickup.wav`

**Key takeaway:** Enhanced player reward systems and engagement.

---

### **8. On-Screen Score Display**

First user interface component added.

**What was added:**
- Score display on screen.
- Custom pixel-art font.
- Global variable for score.

**File changes:**
- **A** `objects/oGameManager/Draw_64.gml`
- **M** `objects/oPlayer/Collision_oCherry.gml`
- **M** `objects/oPlayer/Create_0.gml`
- **A** `scripts/globals/globals.gml`

**Key takeaway:** Constant visual feedback on player progress.

---

### **9. Debug Tools and Terminal Velocity**

Enhanced physics control and debugging tools.

**What was added:**
- Terminal velocity cap.
- Debug messages for speed.

**File changes:**
- **M** `objects/oPlayer/Create_0.gml`
- **M** `objects/oPlayer/Step_0.gml`

**Key takeaway:** Facilitated stable gameplay and easier testing.

---

### **10. Hazards and Death Sequence**

Introduction of hazards and player death mechanics.

**What was added:**
- Spikes hazard.
- Death sequence with animation, sound, and level restart.
- Fade-to-black transition.

**File changes:**
- **A** `objects/oFadeController/Create_0.gml`
- **A** `objects/oFadeController/Draw_64.gml`
- **A** `objects/oFadeController/Step_0.gml`
- **A** `objects/oPlayer/Alarm_0.gml`
- **A** `objects/oPlayer/Collision_oSpike.gml`
- **M** `objects/oPlayer/Create_0.gml`
- **M** `objects/oPlayer/Step_0.gml`
- **A** `sounds/sndDie/sndDie.wav`

**Key takeaway:** Added challenge and penalties, deepening gameplay experience.

---

### **11. Room Transitions**

Implemented transitions between levels.

**What was added:**
- Exit doors and spawn markers.
- Persistent player and manager objects.

**File changes:**
- Multiple objects/scripts modified, including:
  - **A** `objects/oExit/Collision_oPlayer.gml`
  - **M** `objects/oFadeController/Step_0.gml`
  - **M** `objects/oGameManager/Draw_64.gml`
  - **M** `objects/oPlayer/Alarm_0.gml`
  - **M** `objects/oPlayer/Create_0.gml`
  - **A** `objects/oPlayer/Other_4.gml`
  - **M** `scripts/globals/globals.gml`

**Key takeaway:** Enabled interconnected, expansive level design.

---

### **12. God Mode**

Added developer testing functionality.

**What was added:**
- Invincibility toggle with visual indicator.

**File changes:**
- **M** multiple game manager/player scripts.

**Key takeaway:** Powerful developer tool for uninterrupted testing.

---

### **13. Soundtrack and Organization**

Improved game atmosphere and organization.

**What was added:**
- Background music.
- Music Manager object.
- Editor icons for invisible objects.

**File changes:**
- **A** `objects/oMusicManager/Create_0.gml`
- **M** `scripts/globals/globals.gml`
- **A** soundtrack files

**Key takeaway:** Enhanced immersion and improved project management.

