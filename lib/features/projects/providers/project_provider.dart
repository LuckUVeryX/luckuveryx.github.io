import 'package:luckuveryx/features/projects/projects.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_provider.g.dart';

@riverpod
List<Project> projects(ProjectsRef ref) {
  return Project.values;
}
