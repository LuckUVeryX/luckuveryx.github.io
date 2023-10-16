import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:luckuveryx/features/responsive/utils/utils.dart';
import 'package:luckuveryx/widgets/widgets.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HoverButton(
              onPressed: () {},
              builder: (details) => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'LinkedIn',
                    style: context.titleStyle?.copyWith(
                      color: details.color,
                    ),
                  ),
                  Spacing.sp4,
                  FaIcon(
                    FontAwesomeIcons.arrowUpRightFromSquare,
                    size: 12,
                    color: details.color,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
