import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:luckuveryx/features/info/info.dart';

class LocationInfoLinks extends HookConsumerWidget {
  const LocationInfoLinks({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final link = ref.watch(locationInfoLinkProvider);
    return InfoLinkButton(
      link: link,
      textAlign: TextAlign.right,
    );
  }
}
