import 'package:luckuveryx/features/analytics/analytics.dart';
import 'package:luckuveryx/features/info/info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_info_links_provider.g.dart';

@riverpod
InfoLink locationInfoLink(LocationInfoLinkRef ref) {
  return InfoLink(
    label: '1.3521° N, 103.8198° E',
    url: Uri.parse('https://maps.app.goo.gl/f2s8ejFtpiUPTtmW6'),
    event: AnalyticsEvent.locationViewed(),
  );
}
