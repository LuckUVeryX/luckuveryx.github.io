import 'package:luckuveryx/features/info/info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'info_provider.g.dart';

@riverpod
List<InfoLink> infoLinks(InfoLinksRef ref) {
  return [
    InfoLink(
      label: 'LinkedIn',
      url: Uri.parse('https://www.linkedin.com/in/ryan-yip-luckuveryx/'),
    ),
    InfoLink(
      label: 'GitHub',
      url: Uri.parse('https://github.com/LuckUVeryX'),
    ),
  ];
}
