import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RouteButtonPlaceholder extends StatelessWidget {
  const RouteButtonPlaceholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: FaIcon(
        FontAwesomeIcons.solidSquare,
        size: 12,
      ),
    );
  }
}
