import 'package:flutter/material.dart';
import 'package:luckuveryx/features/info/info.dart';

class InfoPageDesktop extends StatelessWidget {
  const InfoPageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(24),
      child: Stack(
        children: [
          Align(child: ExternalInfoLinks()),
          Align(alignment: Alignment.topRight, child: ResumeInfoLinks()),
          Align(alignment: Alignment.bottomRight, child: LocationInfoLinks()),
        ],
      ),
    );
  }
}
