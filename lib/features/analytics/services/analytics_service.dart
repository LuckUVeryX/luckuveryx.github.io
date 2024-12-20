import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:luckuveryx/features/analytics/analytics.dart';
import 'package:posthog_flutter/posthog_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'analytics_service.g.dart';

@riverpod
AnalyticsService _analyticsService(Ref ref) {
  return AnalyticsService._(Posthog());
}

class AnalyticsService {
  const AnalyticsService._(this._posthog);

  final Posthog _posthog;

  void capture(AnalyticsEvent event) {
    _posthog.capture(
      eventName: event.eventName,
      properties: event.properties,
    );
  }
}

extension AnalyticsRefX on Ref {
  void capture(AnalyticsEvent event) {
    read(_analyticsServiceProvider).capture(event);
  }
}

extension AnalyticsWidgetRefX on WidgetRef {
  void capture(AnalyticsEvent event) {
    read(_analyticsServiceProvider).capture(event);
  }
}
