import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'skeleton_view_game.dart'; // Import the Flame game widget

class SkeletonEditorPage extends StatelessWidget {
  const SkeletonEditorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skeleton Editor'),
      ),
      body: Row(
        children: [
          SizedBox(width: 100,),
          // Column 1: Front View
          Expanded(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Front View', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    // Embed the Flame game widget
                    child: GameWidget(game: SkeletonViewGame(viewName: 'Front')),
                  ),
                ),
              ],
            ),
          ),
          // Column 2: Side View
          Expanded(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Side View', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: GameWidget(game: SkeletonViewGame(viewName: 'Side')),
                  ),
                ),
              ],
            ),
          ),
          // Column 3: Back View
          Expanded(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Back View', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: GameWidget(game: SkeletonViewGame(viewName: 'Back')),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 100,),
        ],
      ),
    );
  }
}
