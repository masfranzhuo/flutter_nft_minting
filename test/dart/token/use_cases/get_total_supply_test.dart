import 'package:dartz/dartz.dart';
import 'package:flutter_token/core/use_case.dart';
import 'package:flutter_token/token/repositories/token_repository.dart';
import 'package:flutter_token/token/use_cases/get_total_supply.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_total_supply_test.mocks.dart';

@GenerateMocks([TokenRepository])
void main() {
  late GetTotalSupply getTotalSupply;
  late MockTokenRepository mockTokenRepository;

  setUp(() {
    mockTokenRepository = MockTokenRepository();
    getTotalSupply = GetTotalSupply(repository: mockTokenRepository);
  });

  test('should return total supply = 1000', () async {
    when(mockTokenRepository.getTotalSupply()).thenAnswer(
      (_) async => const Right(1000),
    );

    final result = await getTotalSupply(NoParams());

    verify(mockTokenRepository.getTotalSupply());
    expect((result as Right).value, 1000);
  });
}
