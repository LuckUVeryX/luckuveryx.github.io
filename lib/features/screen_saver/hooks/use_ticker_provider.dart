import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Creates a single usage [TickerProvider].
///
/// See also:
///  * [TickerProviderStateMixin]
TickerProvider useTickerProvider({List<Object?>? keys}) {
  return use(
    keys != null ? _TickerProviderHook(keys) : const _TickerProviderHook(),
  );
}

class _TickerProviderHook extends Hook<TickerProvider> {
  const _TickerProviderHook([List<Object?>? keys]) : super(keys: keys);

  @override
  _TickerProviderHookState createState() => _TickerProviderHookState();
}

class _TickerProviderHookState
    extends HookState<TickerProvider, _TickerProviderHook>
    implements TickerProvider {
  final Set<Ticker> _tickers = {};

  @override
  Ticker createTicker(TickerCallback onTick) {
    final ticker = Ticker(onTick, debugLabel: 'created by $context');
    _tickers.add(ticker);
    return ticker;
  }

  @override
  void dispose() {
    assert(
      () {
        for (final ticker in _tickers) {
          if (ticker.isActive) {
            throw FlutterError(
                'useTickerProvider created a Ticker, but at the time '
                'dispose() was called on the Hook, that Ticker was still active. Tickers used '
                ' by AnimationControllers should be disposed by calling dispose() on '
                ' the AnimationController itself. Otherwise, the ticker will leak.\n');
          }
        }
        return true;
      }(),
      '',
    );
  }

  @override
  TickerProvider build(BuildContext context) {
    for (final ticker in _tickers) {
      ticker.muted = !TickerMode.of(context);
    }
    return this;
  }

  @override
  String get debugLabel => 'useTickerProvider';

  @override
  bool get debugSkipValue => true;
}
