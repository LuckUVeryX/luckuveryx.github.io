import 'package:flutter/material.dart';
import 'package:luckuveryx/features/info/info.dart';
import 'package:luckuveryx/widgets/widgets.dart';

class InfoPageMobile extends StatelessWidget {
  const InfoPageMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ResumeInfoLinks(),
            Spacing.sp40,
            ExternalInfoLinks(),
            Spacing.sp40,
            LocationInfoLinks(),
          ],
        ),
      ),
    );
  }
}
