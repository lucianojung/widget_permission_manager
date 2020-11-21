library authentication_widget;

import 'package:authentication_widget/authentication.dart';
import 'package:authentication_widget/authentication_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('My Widget has a child and a duration',
      (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    Authentication auth =
        Authentication(0, 'Authentication', ['Role1', 'Role2']);
    String role = 'Role1';
    Widget child = SizedBox();
    Duration duration = Duration(milliseconds: 100);
    final authWidget = AuthenticationWidget(
      child: child,
      auth: auth,
      role: role,
    );

    await tester.pumpWidget(authWidget);

    final childFinder = find.byWidget(child);

    expect(childFinder, findsOneWidget);
  });
}
