import 'package:flame/components.dart';
import 'package:flutter/material.dart';

// Represents a single, draggable body part in the skeleton view.
class BodyPart extends PositionComponent {
  final String name;
  final Color color;
  final Vector2 initialPosition;

  BodyPart({
    required this.name,
    required this.initialPosition,
    this.color = Colors.red, // Default color
    super.size, // Size can be set for the visual representation
  }) : super(position: initialPosition);

  // TODO: Add visual representation (e.g., a shape or sprite)
  // TODO: Add drag handling logic

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    // Example: Add a simple rectangle shape for visualization
    add(RectangleComponent(
      size: size, // Use the size passed to BodyPart
      paint: Paint()..color = color,
    ));
    anchor = Anchor.center; // Make position represent the center
  }

  // Placeholder for update logic if needed
  @override
  void update(double dt) {
    super.update(dt);
  }

  // Placeholder for render logic if needed (usually handled by children)
  @override
  void render(Canvas canvas) {
    super.render(canvas);
    // You could draw custom things here if not using child components
  }
}
