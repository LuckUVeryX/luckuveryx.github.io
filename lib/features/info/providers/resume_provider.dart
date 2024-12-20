import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:luckuveryx/features/analytics/analytics.dart';
import 'package:luckuveryx/features/info/info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'resume_provider.g.dart';

@riverpod
InfoLink resume(Ref ref) {
  return InfoLink(
    label: 'Resume',
    url: Uri.parse(
      'https://raw.githubusercontent.com/LuckUVeryX/luckuveryx.github.io/main/assets/ryan_yip_resume.pdf',
    ),
    event: AnalyticsEvent.resumeViewed(),
  );
}
