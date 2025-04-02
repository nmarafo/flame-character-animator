import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'body_part.dart'; // Import the BodyPart component

// Represents a single view (Front, Side, Back) of the skeleton
class SkeletonViewGame extends FlameGame {
  final String viewName; // e.g., "Front", "Side", "Back"

  SkeletonViewGame({required this.viewName});

  // Set the background color to transparent
  @override
  Color backgroundColor() => Colors.transparent;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    camera.viewfinder.anchor = Anchor.center; // Center the view

    // Define positions based on viewName
    Vector2 headPos;
    Vector2 torsoPos;
    Vector2 leftArmPos;
    Vector2 rightArmPos;
    // Define sizes (can also vary by view if needed)
    Vector2 headSize = Vector2(50, 50);
    Vector2 torsoSize = Vector2(80, 100);
    Vector2 armSize = Vector2(20, 70); // Same size for both arms for now

    // --- Define Positions based on View ---
    if (viewName == 'Side') {
      // Positions for Side View (adjust X values mainly)
      headPos = Vector2(0, -150); // Head might be centered
      torsoPos = Vector2(0, -75); // Torso centered
      // For side view, arms might be closer together horizontally
      // or you might only show one, depending on desired style.
      // Let's place them very close for a simple representation.
      leftArmPos = Vector2(-5, -60); 
      rightArmPos = Vector2(5, -60); // Slightly offset or overlapping
      // Adjust arm size if needed for perspective
      // armSize = Vector2(15, 70); // Example: slightly thinner arm in side view

    } else { 
      // Default positions (used for Front and Back for now)
      headPos = Vector2(0, -150);
      torsoPos = Vector2(0, -75);
      leftArmPos = Vector2(-60, -60); // Wider separation for front/back
      rightArmPos = Vector2(60, -60);
    }
    // --- End Define Positions ---


    // Add body parts using the defined positions and sizes
    add(BodyPart(
      name: 'Head ($viewName)',
      initialPosition: headPos,
      size: headSize,
      color: Colors.blue,
    ));
    add(BodyPart(
      name: 'Torso ($viewName)',
      initialPosition: torsoPos,
      size: torsoSize,
      color: Colors.green,
    ));
    add(BodyPart(
      name: 'Left Arm ($viewName)',
      initialPosition: leftArmPos,
      size: armSize, // Use potentially adjusted armSize
      color: Colors.orange,
    ));
    add(BodyPart(
      name: 'Right Arm ($viewName)',
      initialPosition: rightArmPos,
      size: armSize, // Use potentially adjusted armSize
      color: Colors.purple,
    ));
    
    // TODO: Add definitions and logic for legs, hands, etc. for each view
  }
}
