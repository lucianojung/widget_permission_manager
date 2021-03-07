import 'package:authentication_widget/authorization.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('test Authentication creation', () {
    final authentication =
        Authorization(0, 'Authentication', ['Role1', 'Role2']);

    expect(authentication.id, 0);
    expect(authentication.name, 'Authentication');
  });

  test('test Role validation', () {
    final authentication =
        Authorization(0, 'Authentication', ['Role1', 'Role2']);

    expect(authentication.validateRole('Role1'), true);
    expect(authentication.validateRole('Role3'), false);
  });
}
