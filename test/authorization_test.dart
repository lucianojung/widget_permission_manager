import 'package:flutter_test/flutter_test.dart';
import 'package:widget_permission_manager/authorization.dart';

void main() {
  test('test Authorization creation', () {
    final authorization =
        Authorization(0, 'Authorization', ['Role1', 'Role2']);

    expect(authorization.id, 0);
    expect(authorization.name, 'Authorization');
  });

  test('test Role validation', () {
    final authorization =
        Authorization(0, 'Authorization', ['Role1', 'Role2']);

    expect(authorization.validateRole('Role1'), true);
    expect(authorization.validateRole('Role3'), false);
  });
}
