import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:luckuveryx/features/info/info.dart';
import 'package:luckuveryx/features/responsive/responsive.dart';
import 'package:luckuveryx/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoLinkButton extends StatelessWidget {
  const InfoLinkButton({
    required this.link,
    super.key,
  });

  final InfoLink link;

  @override
  Widget build(BuildContext context) {
    return HoverButton(
      onPressed: () => launchUrl(link.url),
      builder: (details) => Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            link.label,
            style: context.titleStyle?.copyWith(
              color: details.color,
            ),
          ),
          Spacing.sp4,
          FaIcon(
            FontAwesomeIcons.arrowUpRightFromSquare,
            size: 8,
            color: details.color,
          ),
        ],
      ),
    );
  }
}
