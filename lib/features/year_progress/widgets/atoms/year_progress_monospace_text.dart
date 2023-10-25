import 'package:flutter/material.dart';

class YearProgressMonospaceText extends StatelessWidget {
  const YearProgressMonospaceText({
    required this.char,
    super.key,
  });

  final String char;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 8,
      child: Text(
        char,
        textAlign: TextAlign.center,
      ),
    );
  }
}
