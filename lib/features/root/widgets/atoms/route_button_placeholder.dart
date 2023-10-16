import 'package:flutter/material.dart';
import 'package:luckuveryx/utils/theme_extensions.dart';

class RouteButtonPlaceholder extends StatelessWidget {
  const RouteButtonPlaceholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: const Size(0, 32),
      ),
      onPressed: null,
      child: Container(
        height: 6,
        width: 6,
        decoration: BoxDecoration(
          color: context.colorScheme.onBackground,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
