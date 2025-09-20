# Fodian Tetris Platformer

A creative platformer game that combines Tetris mechanics with mountain climbing! Use falling Tetris pieces to build platforms and navigate a challenging mountain terrain.

## Game Concept

- **Player Character**: Controls a portal that spawns Tetris pieces from the sky
- **Portal System**: Move the portal to position where you want pieces to fall
- **Tetris Pieces**: Fall from the portal and can be used as platforms
- **Mountain Terrain**: A procedurally generated mountain that's difficult to traverse
- **Objective**: Use the falling pieces strategically to climb the mountain

## Controls

- **Arrow Keys / WASD**: Move player character
- **Space**: Toggle portal control mode
- **Up Arrow / W**: Spawn Tetris piece (when controlling portal)
- **Escape**: Quit game

## Game Mechanics

### Portal Control
1. Press **Space** to enter portal control mode
2. Use **Arrow Keys** to move the portal horizontally
3. Press **Up Arrow** to spawn a Tetris piece from the portal
4. Press **Space** again to return to player control

### Tetris Pieces
- 7 different piece types (I, O, T, S, Z, J, L)
- Each piece has different shapes and colors
- Pieces fall with physics and can be used as platforms
- Pieces stick to the terrain when they land

### Mountain Terrain
- Procedurally generated mountain with peaks and valleys
- Snow-capped peaks (white) and rocky terrain (gray)
- Challenging to traverse without building platforms

## Setup Instructions

1. Open the project in Godot 4.5
2. The main scene is already set to scenes/Main.tscn
3. Run the project to start playing

## File Structure

`
scripts/
 Player.gd          # Player character controller
 Portal.gd          # Portal system for spawning pieces
 TetrisPiece.gd     # Individual Tetris piece logic
 GameManager.gd     # Main game state management
 TetrisSpawner.gd   # Automatic piece spawning
 MountainTerrain.gd # Procedural terrain generation

scenes/
 Main.tscn          # Main game scene
`

## Future Enhancements

- **Map Generation**: Chunk-based loading for larger worlds
- **Power-ups**: Special pieces with unique abilities
- **Multiplayer**: Cooperative portal control
- **Levels**: Different mountain challenges
- **Scoring**: Points for efficient platform building
- **Visual Effects**: Particle systems and animations

## Development Notes

The game uses Godot 4.5's physics system for realistic piece falling and collision detection. The portal system allows for strategic piece placement, making each playthrough unique based on player decisions.

Enjoy building your way up the mountain! 
