import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class Logger extends ProviderObserver {
  const Logger();

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    log('''
[${provider.name ?? provider.runtimeType}]:
$newValue
''');
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    log('''
[${provider.name ?? provider.runtimeType}]:
$error
$stackTrace
}''');
  }
}
