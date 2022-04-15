import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_token/token/repositories/token_repository.dart';
import 'package:flutter_token/token/use_cases/withdraw_stake.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'withdraw_stake_test.mocks.dart';

@GenerateMocks([TokenRepository])
void main() {
  late WithdrawStake withdrawStake;
  late MockTokenRepository mockTokenRepository;

  setUp(() {
    mockTokenRepository = MockTokenRepository();
    withdrawStake = WithdrawStake(repository: mockTokenRepository);
  });

  test('should call stakeToken()', () async {
    when(mockTokenRepository.withdrawStake(
      amount: anyNamed('amount'),
      index: anyNamed('index'),
    )).thenAnswer((_) async => const Right(unit));

    await withdrawStake(const Params(amount: 1000, index: 0));

    verify(mockTokenRepository.withdrawStake(
      amount: anyNamed('amount'),
      index: anyNamed('index'),
    ));
  });
}
