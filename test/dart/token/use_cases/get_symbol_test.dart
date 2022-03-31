import 'package:dartz/dartz.dart';
import 'package:flutter_token/core/use_case.dart';
import 'package:flutter_token/token/repositories/token_repository.dart';
import 'package:flutter_token/token/use_cases/get_symbol.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_symbol_test.mocks.dart';

@GenerateMocks([TokenRepository])
void main() {
  late GetSymbol getSymbol;
  late MockTokenRepository mockTokenRepository;

  setUp(() {
    mockTokenRepository = MockTokenRepository();
    getSymbol = GetSymbol(repository: mockTokenRepository);
  });

  test('should return symbol = "TN"', () async {
    when(mockTokenRepository.getSymbol()).thenAnswer(
      (_) async => const Right('TN'),
    );

    final result = await getSymbol(NoParams());

    verify(mockTokenRepository.getSymbol());
    expect((result as Right).value, 'TN');
  });
}
