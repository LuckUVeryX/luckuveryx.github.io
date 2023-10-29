import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'screen_saver_settings_controller.g.dart';

@riverpod
class ScreenSaverSettingsController extends _$ScreenSaverSettingsController {
  @override
  ({double speed, double size}) build() {
    return (speed: 2, size: 48);
  }

  void onSpeedChanged(double value) {
    final (speed: _, :size) = state;
    state = (speed: value, size: size);
  }

  void onSizeChanged(double value) {
    final (:speed, size: _) = state;
    state = (speed: speed, size: value);
  }
}
