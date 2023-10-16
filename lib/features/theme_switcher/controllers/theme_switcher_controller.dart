import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_switcher_controller.g.dart';

@riverpod
class ThemeSwitcherController extends _$ThemeSwitcherController {
  @override
  ThemeMode build() {
    return ThemeMode.system;
  }

  void onChanged(Brightness brightness) {
    state = switch (brightness) {
      Brightness.light => ThemeMode.light,
      Brightness.dark => ThemeMode.dark,
    };
    return;
  }
}
