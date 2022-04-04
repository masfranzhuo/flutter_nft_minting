import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_token/token/repositories/token_repository.dart';
import 'package:flutter_token/token/use_cases/transfer.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'transfer_test.mocks.dart';

@GenerateMocks([TokenRepository])
void main() {
  late Transfer transfer;
  late MockTokenRepository mockTokenRepository;

  setUp(() {
    mockTokenRepository = MockTokenRepository();
    transfer = Transfer(repository: mockTokenRepository);
  });

  test('should call transfer()', () async {
    when(mockTokenRepository.transfer(
      amount: anyNamed('amount'),
      addressHexString: anyNamed('addressHexString'),
    )).thenAnswer(
      (_) async => const Right(unit),
    );

    await transfer(const Params(
      amount: 1000,
      addressHexString: '0x47E2935e04CdA3bAFD7e399244d430914939D544',
    ));

    verify(mockTokenRepository.transfer(
      amount: anyNamed('amount'),
      addressHexString: anyNamed('addressHexString'),
    ));
  });
}
