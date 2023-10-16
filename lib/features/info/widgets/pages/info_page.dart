import 'package:flutter/material.dart';
import 'package:luckuveryx/features/info/info.dart';
import 'package:luckuveryx/features/responsive/responsive.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Widget page;
    switch (ResponsiveLayout.of(context)) {
      case ResponsiveLayout.xs:
      case ResponsiveLayout.sm:
      case ResponsiveLayout.md:
        page = const InfoPageMobile();
      case ResponsiveLayout.lg:
      case ResponsiveLayout.xl:
      case ResponsiveLayout.xxl:
        page = const InfoPageDesktop();
    }
    return page;
  }
}
