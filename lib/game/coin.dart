import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'player.dart'; // Import player class for updating coins

class Coin extends SpriteComponent with HasGameRef {
  Coin({Vector2? position}) : super(size: Vector2.all(32), position: position);

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('coin.png'); // Ensure you have 'coin.png' in assets
  }
}

class CoinManager extends Component with HasGameRef {
  final Timer _timer = Timer(2, repeat: true); // Spawns a coin every 2 seconds

  CoinManager() {
    _timer.onTick = _spawnCoin;
  }

  @override
  void onMount() {
    super.onMount();
    _timer.start();
  }

  @override
  void update(double dt) {
    _timer.update(dt);
  }

  void _spawnCoin() {
    final coin = Coin(position: Vector2(500, 300)); // Adjust position logic
    gameRef.add(coin);
  }

  void removeAllCoins() {
    gameRef.children.whereType<Coin>().forEach((coin) => coin.removeFromParent());
  }
}
