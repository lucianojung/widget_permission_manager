library authentication_widget;

import 'package:authentication_widget/authorization.dart';
import 'package:authentication_widget/authorization_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('My Widget has a child and a duration',
      (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    Authorization auth =
        Authorization(0, 'Authentication', ['Role1', 'Role2']);
    String role = 'Role1';
    Widget child = SizedBox();
    Duration duration = Duration(milliseconds: 100);
    final authWidget = AuthorizationWidget(
      child: child,
      auth: auth,
      role: role,
    );

    await tester.pumpWidget(authWidget);

    final childFinder = find.byWidget(child);

    expect(childFinder, findsOneWidget);
  });
}
