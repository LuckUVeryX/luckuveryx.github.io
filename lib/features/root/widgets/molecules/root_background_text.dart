import 'package:flutter/material.dart';
import 'package:luckuveryx/utils/theme_extensions.dart';

class RootBackgroundText extends StatelessWidget {
  const RootBackgroundText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -920,
      bottom: 0,
      child: Text(
        'LUCKUVERYX.',
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.clip,
        style: context.textTheme.displayLarge?.copyWith(
          color: context.theme.disabledColor.withOpacity(
            context.theme.brightness == Brightness.light ? 0.1 : 0.05,
          ),
          fontWeight: FontWeight.bold,
          fontSize: 200,
          letterSpacing: 12,
        ),
      ),
    );
  }
}
