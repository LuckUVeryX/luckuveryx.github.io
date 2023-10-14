import 'package:flutter_test/flutter_test.dart';

extension PumpFrame on WidgetTester {
  Future<void> pumpFrame(
    Duration maxDuration, [
    Duration interval = const Duration(milliseconds: 16, microseconds: 683),
  ]) async {
    var elapsed = Duration.zero;
    while (elapsed < maxDuration) {
      await pump(interval);
      elapsed += interval;
    }
  }
}
