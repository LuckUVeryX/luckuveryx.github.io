import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:luckuveryx/const/const.dart';
import 'package:luckuveryx/features/home/widgets/organisms/molecules/home_bottom_footer_text.dart';

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
            onPressed: UrlLink.gitHub.launch,
            icon: const FaIcon(FontAwesomeIcons.github),
          ),
          IconButton(
            onPressed: UrlLink.linkedIn.launch,
            icon: const FaIcon(FontAwesomeIcons.linkedin),
          ),
          const Spacer(),
          const HomeBottomFooterText(),
        ],
      ),
    );
  }
}
