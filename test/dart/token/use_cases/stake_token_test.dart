import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_token/token/repositories/token_repository.dart';
import 'package:flutter_token/token/use_cases/stake_token.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'stake_token_test.mocks.dart';

@GenerateMocks([TokenRepository])
void main() {
  late StakeToken stakeToken;
  late MockTokenRepository mockTokenRepository;

  setUp(() {
    mockTokenRepository = MockTokenRepository();
    stakeToken = StakeToken(repository: mockTokenRepository);
  });

  test('should call stakeToken()', () async {
    when(mockTokenRepository.stakeToken(
      amount: anyNamed('amount'),
    )).thenAnswer((_) async => const Right(unit));

    await stakeToken(const Params(amount: 1000));

    verify(mockTokenRepository.stakeToken(amount: anyNamed('amount')));
  });
}
