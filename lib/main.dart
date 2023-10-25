import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:luckuveryx/app/app.dart';
import 'package:luckuveryx/bootstrap.dart';

void main(List<String> args) {
  bootstrap(
    () => const ProviderScope(
      child: App(),
    ),
  );
}
