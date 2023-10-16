import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:luckuveryx/features/info/info.dart';

class ResumeInfoLinks extends HookConsumerWidget {
  const ResumeInfoLinks({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resume = ref.watch(resumeProvider);
    return InfoLinkButton(link: resume);
  }
}
