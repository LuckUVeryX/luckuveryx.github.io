import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:luckuveryx/features/analytics/analytics.dart';

part 'info_links.freezed.dart';

@freezed
abstract class InfoLink with _$InfoLink {
  const factory InfoLink({
    required String label,
    required Uri url,
    required AnalyticsEvent event,
  }) = _InfoLink;
}
