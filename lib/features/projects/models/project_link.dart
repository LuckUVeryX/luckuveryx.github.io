import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_link.freezed.dart';

@freezed
abstract class ProjectLink with _$ProjectLink {
  const factory ProjectLink({required String label, required Uri url}) =
      _ProjectLink;
}
