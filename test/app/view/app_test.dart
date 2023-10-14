import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:luckuveryx/app/app.dart';

import '../../helpers/pump_frame.dart';

void main() {
  group('App', () {
    testWidgets('renders MaterialApp', (tester) async {
      await tester.pumpWidget(const ProviderScope(child: App()));
      await tester.pumpFrame(const Duration(seconds: 1));
      expect(find.byType(MaterialApp), findsOneWidget);
    });
  });
}
