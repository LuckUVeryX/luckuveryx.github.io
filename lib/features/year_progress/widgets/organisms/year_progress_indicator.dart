import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:luckuveryx/features/year_progress/widgets/atoms/year_progress_monospace_text.dart';
import 'package:luckuveryx/features/year_progress/widgets/molecules/year_progress_remaining_countdown.dart';
import 'package:luckuveryx/l10n/l10n.dart';
import 'package:luckuveryx/utils/theme_extensions.dart';
import 'package:luckuveryx/widgets/widgets.dart';

class YearProgressIndicator extends HookWidget {
  const YearProgressIndicator({super.key});
  @override
  Widget build(BuildContext context) {
    final tickerProvider = useSingleTickerProvider();
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 5000),
    );
    final color = useAnimation(
      ColorTween(
        begin: context.colorScheme.primary,
        end: context.colorScheme.secondary,
      ).animate(controller),
    );

    final now = useState(DateTime.now());
    final currYear = DateTime(now.value.year);
    final nextYear = DateTime(now.value.year + 1);
    final yearDiff = nextYear.difference(currYear);
    final diff = now.value.difference(currYear);
    final yearProg = diff.inMicroseconds / yearDiff.inMicroseconds;
    final remaining = nextYear.difference(now.value);

    useEffect(
      () {
        final ticker = tickerProvider.createTicker((_) {
          now.value = DateTime.now();
        })
          ..start();
        return ticker.stop;
      },
      [],
    );

    useEffect(
      () {
        controller.repeat(reverse: true);
        return null;
      },
      [],
    );

    final yearProgText = '${(yearProg * 100).toStringAsPrecision(12)}%'.split(
      '',
    );
    final remainingText = remaining.inDHMS;

    return AnimatedFadeIn(
      child: Tooltip(
        message: context.l10n.yearProgressToolTip,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(28),
                    child: LinearProgressIndicator(
                      color: color,
                      value: yearProg,
                      backgroundColor: color?.withValues(alpha: 0.3),
                    ),
                  ),
                ),
                Spacing.sp8,
                for (final char in yearProgText)
                  YearProgressMonospaceText(char: char),
              ],
            ),
            YearProgressRemainingCountdown(remainingText: remainingText),
          ],
        ),
      ),
    );
  }
}

extension on Duration {
  Duration get remainingHrs {
    return this - Duration(days: inDays);
  }

  Duration get remainingMins {
    return this - Duration(days: inDays, hours: remainingHrs.inHours);
  }

  Duration get remainingSecs {
    return this -
        Duration(
          days: inDays,
          hours: remainingHrs.inHours,
          minutes: remainingMins.inMinutes,
        );
  }

  String get inDHMS {
    return '$inDays : ${'${remainingHrs.inHours}'.padLeft(2, '0')} : ${'${remainingMins.inMinutes}'.padLeft(2, '0')} : ${'${remainingSecs.inSeconds}'.padLeft(2, '0')}';
  }
}
