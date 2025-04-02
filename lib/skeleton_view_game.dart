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
    // Set a fixed resolution camera if desired, or use default
    // camera.viewport = FixedResolutionViewport(Vector2(400, 600));
    camera.viewfinder.anchor = Anchor.center; // Center the view

    // Example: Add some body parts for this view
    // TODO: Replace with actual body part data and positioning
    add(BodyPart(
      name: 'Head ($viewName)',
      initialPosition: Vector2(0, 0),
      size: Vector2(50, 50),
      color: Colors.blue,
    ));
    add(BodyPart(
      name: 'Torso ($viewName)',
      initialPosition: Vector2(0, -75),
      size: Vector2(80, 100),
      color: Colors.green,
    ));
     add(BodyPart(
      name: 'Left Arm ($viewName)',
      initialPosition: Vector2(-60, -60),
      size: Vector2(20, 70),
      color: Colors.orange,
    ));
      add(BodyPart(
      name: 'Right Arm ($viewName)',
      initialPosition: Vector2(60, -60),
      size: Vector2(20, 70),
      color: Colors.purple,
    ));
    // Add more parts (legs, hands, etc.) as needed
  }

  // Optional: Override update or render if needed for the whole view
}
