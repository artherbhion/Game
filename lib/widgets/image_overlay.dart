import 'package:flutter/material.dart';
import 'package:flame/game.dart';

class ImageOverlay extends StatelessWidget {
  final FlameGame game;

  const ImageOverlay({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.7), // Background overlay
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded( // Ensures full-screen image
                    child: Image.asset(
                      'assets/tutorial.png',
                      fit: BoxFit.cover, // Covers the full screen
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      onPressed: () {
                        game.overlays.remove('ImageOverlay'); // Remove overlay
                        game.resumeEngine(); // Resume the game
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                      ),
                      child: const Text("OK"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
