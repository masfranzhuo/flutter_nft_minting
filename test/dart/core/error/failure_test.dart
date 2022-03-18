import 'package:flutter_smart_contract_counter/core/error/failure.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('props', () {
    const exceptionTest = UnexpectedFailure(message: 'error message');

    expect(exceptionTest.props, ['UNEXPECTED_ERROR', 'error message']);
  });
}
