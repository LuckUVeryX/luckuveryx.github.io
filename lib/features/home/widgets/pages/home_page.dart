import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:luckuveryx/features/home/home.dart';
import 'package:luckuveryx/features/responsive/utils/utils.dart';
import 'package:luckuveryx/l10n/l10n.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: ResponsiveLayout.xl.value),
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [const HomePageAppBar()];
            },
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                context.l10n.homeContent,
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const HomeBottomAppBar(),
    );
  }
}
