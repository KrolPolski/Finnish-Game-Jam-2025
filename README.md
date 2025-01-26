# The Lab Incident
## About
This game was built using the Godot game engine, for the Finnish Game Jam 2025, at the Helsinki Arabia site.

You are a scientist in a lab where something horrible has gone wrong; a portal has appeared and is sending monsters to Earth.
Your objective is to survive as long as you can, prevent any monsters from escaping and send them back to the world from whence they came.
Rack up the highest score you can.

### The Game Ends when:
1. You are touched by an enemy four times
2. Any enemy reaches the lab door on the bottom right.

### Movement
You can move your scientist with WASD or the arrow keys. You can walk left and right, or climb up and down between platforms, but not both at the same time.

You use the space bar to drop a bubble at your location, which will trap enemies that walk into it, but the bubble only lasts a short time.
Once an enemy is trapped, they will float to the top of the lab.

### The Portal
When the portal is green, it is spawning enemies. When it turns orange, the portal has reversed and enemies can be sent back to their world.

If trapped enemies hit the ceiling without hitting an orange portal, the bubble pops and the enemies fall back down, get mad and move even faster.
As the game progresses more and more enemies will spawn faster and faster.

### Scoring
Each time you send an enemy back through the portal, you gain 100 points.
Each time you lay a bubble, you lose twenty points. So don't waste them!

## Build Instructions
You can play this game either by using the included Linux, Windows, or Mac binaries, or you can run it directly in Godot.

WITH EXECUTABLES:

1) Go to "executables" directory and search the right directory for your operating system
2) FOR MAC USERS! MacOs might block your attempt to run the executable. This can be fixed by first running the exe, then going to System preferences --> Security & Privacy --> "Open Anyway" option for the executable file --> your system password. This let's you play the game.


WITH GODOT:

1) Download and install the godot engine from godotengine.org
2) Import the project
3) Click Run
