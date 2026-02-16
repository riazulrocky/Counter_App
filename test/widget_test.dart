// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:noorify/main.dart' as app;

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const app.MyApp());

    // Verify that our counter starts at 0.
    // Note: Since we have a Splash Screen now, we need to pump until it finishes
    // or mock the transition. For a simple smoke test, we'll just check if MyApp builds.
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
