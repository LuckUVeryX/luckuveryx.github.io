import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:luckuveryx/features/root/root.dart';

class RootBottomAppBar extends StatelessWidget {
  const RootBottomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        children: [
          IconButton(
            onPressed: RootLink.gitHub.launch,
            icon: const FaIcon(FontAwesomeIcons.github),
          ),
          IconButton(
            onPressed: RootLink.linkedIn.launch,
            icon: const FaIcon(FontAwesomeIcons.linkedin),
          ),
          const Expanded(child: RootBottomFooterText()),
        ],
      ),
    );
  }
}
