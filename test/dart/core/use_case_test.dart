import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_token/core/use_case.dart';

void main() {
  test('NoParams props', () {
    expect(NoParams().props, []);
  });
}
