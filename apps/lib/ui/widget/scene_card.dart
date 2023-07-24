import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:niku/namespace.dart' as n;

class Scene {
  final String title;
  final IconData icon;

  Scene({
    required this.title,
    required this.icon,
  });
}

class SceneCard extends HookConsumerWidget {
  final Scene scene;
  final Function onTap;
  final bool? active;

  const SceneCard(
      {Key? key, required this.scene, required this.onTap, this.active})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 0),
      color: active != null ? Colors.white.withOpacity(0.3) : Colors.black.withOpacity(0.4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      child: InkWell(
        enableFeedback: false,
        onTap: () => {
          //
          onTap()
        },
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: n.Row([
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(1000),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: n.Icon(scene.icon)
                  ..color = Colors.white
                  ..size = 24,
              ),
            ),
            n.Text(scene.title)
              ..color = Colors.white
              ..ml = 8
              ..bold,
          ])
            ..p = 8
            ..gap = 4,
        ),
      ),
    );
  }
}
