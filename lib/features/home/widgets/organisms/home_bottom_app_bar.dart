import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:luckuveryx/const/const.dart';
import 'package:url_launcher/url_launcher.dart';

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
            onPressed: () => launchUrl(Uri.parse(UrlLinks.linkedIn)),
            icon: const FaIcon(FontAwesomeIcons.linkedinIn),
          ),
          IconButton(
            onPressed: () => launchUrl(Uri.parse(UrlLinks.github)),
            icon: const FaIcon(FontAwesomeIcons.github),
          ),
        ],
      ),
    );
  }
}
