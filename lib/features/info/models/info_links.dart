import 'package:freezed_annotation/freezed_annotation.dart';

part 'info_links.freezed.dart';

@freezed
class InfoLink with _$InfoLink {
  const factory InfoLink({
    required String label,
    required Uri url,
  }) = _InfoLink;
}
