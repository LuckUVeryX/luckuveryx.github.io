import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SkillChip extends HookWidget {
  const SkillChip({required this.label, super.key});

  final String label;
  @override
  Widget build(BuildContext context) {
    const bounceY = 1;
    const rotateAngle = 1;
    const bounceDuration = Duration(milliseconds: 120);
    const rotateDuration = Duration(milliseconds: 100);

    final randomRotate = useRef(Random().nextBool());
    final randomBounce = useRef(Random().nextBool());

    final rotationController = useAnimationController(
      initialValue: 0.5,
      duration: rotateDuration,
    );
    final bounceController = useAnimationController(
      initialValue: 0.5,
      duration: bounceDuration,
    );

    final rotation = useAnimation(
      CurvedAnimation(
        parent: rotationController,
        curve: Curves.easeInOut,
      ).drive(
        Tween<double>(
          begin: -1 * (randomRotate.value ? 1 : -1),
          end: 1 * (randomRotate.value ? 1 : -1),
        ),
      ),
    );

    final bounce = useAnimation(
      CurvedAnimation(
        parent: bounceController,
        curve: Curves.easeInOut,
      ).drive(
        Tween<double>(
          begin: -1 * (randomBounce.value ? 1 : -1),
          end: 1 * (randomBounce.value ? 1 : -1),
        ),
      ),
    );

    return MouseRegion(
      onEnter: (_) {
        rotationController.repeat(reverse: true);
        bounceController.repeat(reverse: true);
      },
      onExit: (_) {
        rotationController.animateTo(0.5);
        bounceController.animateTo(0.5);
      },
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..rotateZ(rotation * rotateAngle * pi / 180)
          ..translate(bounce * bounceY, bounce * bounceY),
        child: Chip(
          label: Text(label),
        ),
      ),
    );
  }
}
