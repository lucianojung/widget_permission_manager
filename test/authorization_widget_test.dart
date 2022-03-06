import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tuple/tuple.dart';
import 'package:widget_permission_manager/authorization.dart';
import 'package:widget_permission_manager/authorization_widget.dart';

void main() {
  testWidgets('My Widget has a child and a duration',
      (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    Authorization auth =
        Authorization(0, 'Authorization', ['Role1', 'Role2']);
    String role = 'Role1';
    Widget child = SizedBox();
    // Duration duration = Duration(milliseconds: 100);
    final authWidget = AuthorizationWidget(
      children: [Tuple2(auth, child)],
      role: role,
    );

    await tester.pumpWidget(authWidget);

    final childFinder = find.byWidget(child);

    expect(childFinder, findsOneWidget);
  });
}
