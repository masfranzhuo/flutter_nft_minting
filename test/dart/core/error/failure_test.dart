import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_token/core/error/failure.dart';

void main() {
  test('props', () {
    const exceptionTest = UnexpectedFailure(message: 'error message');

    expect(exceptionTest.props, ['UNEXPECTED_ERROR', 'error message']);
  });
}
