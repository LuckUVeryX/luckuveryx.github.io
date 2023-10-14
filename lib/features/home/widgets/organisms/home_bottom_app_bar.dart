import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:luckuveryx/features/home/home.dart';

class HomeBottomAppBar extends StatelessWidget {
  const HomeBottomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        children: [
          IconButton(
            onPressed: HomeLink.gitHub.launch,
            icon: const FaIcon(FontAwesomeIcons.github),
          ),
          IconButton(
            onPressed: HomeLink.linkedIn.launch,
            icon: const FaIcon(FontAwesomeIcons.linkedin),
          ),
          const Expanded(child: HomeBottomFooterText()),
        ],
      ),
    );
  }
}
