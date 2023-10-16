import 'package:flutter/material.dart';
import 'package:luckuveryx/l10n/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: SizedBox(
        width: 200,
        child: Text(
          context.l10n.homeContent,
        ),
      ),
    );
  }
}
