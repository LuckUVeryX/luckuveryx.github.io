import 'package:flutter/material.dart';
import 'package:luckuveryx/utils/theme_extensions.dart';

class RootBackgroundText extends StatelessWidget {
  const RootBackgroundText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'LUCKUVERYX.',
      maxLines: 1,
      overflow: TextOverflow.clip,
      textAlign: TextAlign.center,
      style: context.textTheme.displayLarge?.copyWith(
        fontSize: 200,
        letterSpacing: 12,
        fontWeight: FontWeight.bold,
        color: context.theme.disabledColor.withOpacity(0.05),
      ),
    );
  }
}
