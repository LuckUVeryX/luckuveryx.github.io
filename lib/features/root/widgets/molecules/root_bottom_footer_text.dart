import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:luckuveryx/features/root/root.dart';
import 'package:luckuveryx/l10n/l10n.dart';
import 'package:luckuveryx/utils/theme_extensions.dart';
import 'package:luckuveryx/widgets/widgets.dart';

class RootBottomFooterText extends StatelessWidget {
  const RootBottomFooterText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: StyledRichText(
            textAlign: TextAlign.right,
            text: context.l10n.footer,
            style: context.textTheme.labelSmall
                ?.copyWith(color: context.theme.disabledColor),
          ),
        ),
        IconButton(
          iconSize: 12,
          onPressed: RootLink.project.launch,
          color: context.theme.disabledColor,
          constraints: const BoxConstraints(),
          icon: const FaIcon(FontAwesomeIcons.github),
        ),
      ],
    );
  }
}
