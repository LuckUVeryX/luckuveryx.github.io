import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:luckuveryx/features/analytics/analytics.dart';
import 'package:luckuveryx/features/info/info.dart';
import 'package:luckuveryx/features/responsive/responsive.dart';
import 'package:luckuveryx/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoLinkButton extends HookConsumerWidget {
  const InfoLinkButton({required this.link, this.textAlign, super.key});

  final InfoLink link;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return HoverButton(
      onPressed: () {
        launchUrl(link.url);
        ref.capture(link.event);
      },
      builder: (details) => Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            link.label,
            style: context.titleStyle?.copyWith(color: details.color),
            textAlign: textAlign,
          ),
          Spacing.sp4,
          FaIcon(
            FontAwesomeIcons.arrowUpRightFromSquare,
            size: context.titleStyle!.fontSize! - 8,
            color: details.color,
          ),
        ],
      ),
    );
  }
}
