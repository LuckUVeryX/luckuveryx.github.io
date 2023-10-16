import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:luckuveryx/features/info/info.dart';
import 'package:luckuveryx/widgets/widgets.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

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
            Spacing.sp40,
            ExternalInfoLinksList(),
            Spacing.sp40,
            LocationInfoLinks(),
          ],
        ),
      ),
    );
  }
}

class LocationInfoLinks extends HookConsumerWidget {
  const LocationInfoLinks({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final link = ref.watch(locationInfoLinkProvider);
    return InfoLinkButton(link: link);
  }
}
