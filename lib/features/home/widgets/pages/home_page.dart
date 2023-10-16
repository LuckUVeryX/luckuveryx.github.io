import 'package:flutter/material.dart';
import 'package:luckuveryx/l10n/l10n.dart';
import 'package:luckuveryx/utils/theme_extensions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.only(right: 24),
        width: 200,
        child: Text(
          context.l10n.homeContent,
          style: context.textTheme.bodyMedium,
        ),
      ),
    );
  }
}
