import 'package:flutter/material.dart';
import 'package:luckuveryx/utils/theme_extensions.dart';

class RouteButtonPlaceholder extends StatelessWidget {
  const RouteButtonPlaceholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
