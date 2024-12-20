import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:luckuveryx/features/projects/projects.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_provider.g.dart';

@riverpod
List<Project> projects(Ref ref) {
  return Project.values;
}
