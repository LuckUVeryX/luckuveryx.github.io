import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:luckuveryx/features/analytics/analytics.dart';
import 'package:luckuveryx/features/info/info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'external_info_links_provider.g.dart';

@riverpod
List<InfoLink> externalInfoLinks(Ref ref) {
  return [
    InfoLink(
      label: 'GitHub',
      url: Uri.parse('https://github.com/LuckUVeryX'),
      event: AnalyticsEvent.githubViewed(),
    ),
    InfoLink(
      label: 'LinkedIn',
      url: Uri.parse('https://www.linkedin.com/in/ryan-yip-luckuveryx/'),
      event: AnalyticsEvent.linkedInViewed(),
    ),
  ];
}
