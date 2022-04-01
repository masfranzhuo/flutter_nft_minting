import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_token/token/repositories/token_repository.dart';
import 'package:flutter_token/token/use_cases/mint.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'mint_test.mocks.dart';

@GenerateMocks([TokenRepository])
void main() {
  late Mint mint;
  late MockTokenRepository mockTokenRepository;

  setUp(() {
    mockTokenRepository = MockTokenRepository();
    mint = Mint(repository: mockTokenRepository);
  });

  test('should call mint()', () async {
    when(mockTokenRepository.mint(amount: anyNamed('amount'))).thenAnswer(
      (_) async => const Right(unit),
    );

    await mint(1000);

    verify(mockTokenRepository.mint(amount: anyNamed('amount')));
  });
}
