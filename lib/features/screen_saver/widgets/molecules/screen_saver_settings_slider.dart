import 'package:flutter/material.dart';
import 'package:luckuveryx/utils/theme_extensions.dart';

class ScreenSaverSetttingsSlider extends StatelessWidget {
  const ScreenSaverSetttingsSlider({
    required this.label,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
    required this.onChangeEnd,
    super.key,
  });

  final String label;
  final double value;
  final double min;
  final double max;
  final ValueChanged<double> onChanged;
  final ValueChanged<double> onChangeEnd;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              Text(label),
              const Spacer(),
              Text(value.toStringAsFixed(1), textAlign: TextAlign.right),
            ],
          ),
        ),
        SizedBox(
          height: 20,
          width: double.infinity,
          child: Slider(
            activeColor: context.colorScheme.tertiaryContainer,
            value: value,
            min: min,
            max: max,
            onChanged: onChanged,
            onChangeEnd: onChangeEnd,
          ),
        ),
      ],
    );
  }
}
