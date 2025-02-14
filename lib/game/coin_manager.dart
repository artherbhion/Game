import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame/game.dart';

import '/models/player_data.dart';

class Coin extends SpriteComponent with CollisionCallbacks {
  @override
  Future<void> onLoad() async {
    sprite = Sprite(await Flame.images.load('coin.png'));
    size = Vector2.all(16);
    add(RectangleHitbox());
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is! FlameGame) return;

    final game = other as FlameGame;
    final playerData = (game as dynamic).playerData as PlayerData?; // ✅ Fixing missing reference

    if (playerData != null) {
      playerData.currentScore += 1;
      FlameAudio.play('coin_collect.wav');
      removeFromParent();
    }
  }
}
