import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  runApp(
    GameWidget(
      game: MyGame(),
    ),
  );
}

class MyGame extends BaseGame {
  final _layersMeta = {
    'bg.png': 1.0,
    'mountain-far.png': 1.5,
    'mountains.png': 2.3,
    'trees.png': 3.8,
    'foreground-trees.png': 6.6,
  };

  @override
  Future<void> onLoad() async {
    final layers = _layersMeta.entries.map(
      (e) => loadParallaxLayer(
        e.key,
        velocityMultiplier: Vector2(e.value, 1.0),
      ),
    );
    final parallax = ParallaxComponent.fromParallax(
      Parallax(
        await Future.wait(layers),
        size,
        baseVelocity: Vector2(20, 0),
      ),
    );
    add(parallax);
  }
}
