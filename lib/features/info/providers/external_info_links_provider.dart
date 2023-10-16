import 'package:luckuveryx/features/info/info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'external_info_links_provider.g.dart';

@riverpod
List<InfoLink> externalInfoLinks(ExternalInfoLinksRef ref) {
  return [
    InfoLink(
      label: 'GitHub',
      url: Uri.parse('https://github.com/LuckUVeryX'),
    ),
    InfoLink(
      label: 'LinkedIn',
      url: Uri.parse('https://www.linkedin.com/in/ryan-yip-luckuveryx/'),
    ),
  ];
}
