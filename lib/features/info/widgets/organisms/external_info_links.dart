import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:luckuveryx/features/info/info.dart';

class ExternalInfoLinks extends HookConsumerWidget {
  const ExternalInfoLinks({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final links = ref.watch(externalInfoLinksProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ...links.map(
          (link) => InfoLinkButton(link: link),
        ),
      ],
    );
  }
}
