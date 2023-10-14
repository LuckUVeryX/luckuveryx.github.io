import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

enum _Link { gitHub, linkedIn }

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ..._Link.values.map(
          (e) => IconButton(
            iconSize: 20,
            onPressed: e.launch,
            icon: FaIcon(e.icon),
          ),
        ),
      ],
    );
  }
}

extension on _Link {
  Uri get uri {
    return switch (this) {
      _Link.gitHub => Uri.parse('https://github.com/LuckUVeryX'),
      _Link.linkedIn =>
        Uri.parse('https://www.linkedin.com/in/ryan-yip-luckuveryx/'),
    };
  }

  IconData get icon {
    return switch (this) {
      _Link.gitHub => FontAwesomeIcons.github,
      _Link.linkedIn => FontAwesomeIcons.linkedin,
    };
  }

  void launch() => launchUrl(uri);
}
