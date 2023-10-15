import 'package:luckuveryx/features/experiences/experiences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'experiences_provider.g.dart';

@riverpod
List<Experience> experiences(ExperiencesRef ref) {
  return [
    GlintsExperience(),
  ];
}
