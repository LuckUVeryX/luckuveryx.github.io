// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:async';
import 'dart:developer';
import 'dart:html' as html;
import 'dart:js' as js;

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  if (kIsWeb) {
    const postHogKey = String.fromEnvironment('POST_HOG_API_KEY');
    js.context['POST_HOG_API_KEY'] = postHogKey;
    html.document.dispatchEvent(html.CustomEvent('keys_loaded'));
  }

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  runApp(await builder());
}
