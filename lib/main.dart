import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:luckuveryx/app/app.dart';
import 'package:luckuveryx/bootstrap.dart';
import 'package:luckuveryx/utils/logger.dart';

void main(List<String> args) {
  bootstrap(
    () => const ProviderScope(
      observers: [Logger()],
      child: App(),
    ),
  );
}
