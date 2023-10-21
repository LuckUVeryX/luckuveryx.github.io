// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:async';
import 'dart:developer';
import 'dart:html' as html;
import 'dart:js' as js;

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:luckuveryx/app/api/api.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  if (kIsWeb) {
    js.context['POST_HOG_API_KEY'] = ApiKeys.postHog;
    html.document.dispatchEvent(html.CustomEvent('keys_loaded'));
  }

  runApp(await builder());
}
