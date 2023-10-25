import 'package:flutter/material.dart';
import 'package:luckuveryx/features/year_progress/widgets/atoms/year_progress_monospace_text.dart';

class YearProgressRemainingCountdown extends StatelessWidget {
  const YearProgressRemainingCountdown({
    required this.remainingText,
    super.key,
  });

  final String remainingText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (final char in remainingText.split(''))
          YearProgressMonospaceText(char: char),
      ],
    );
  }
}
