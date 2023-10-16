import 'package:luckuveryx/features/info/info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'resume_provider.g.dart';

@riverpod
InfoLink resume(ResumeRef ref) {
  return InfoLink(
    label: 'Resume',
    url: Uri.parse(
      'https://github.com/LuckUVeryX/luckuveryx.github.io/blob/main/assets/ryan_yip_resume.pdf',
    ),
  );
}
