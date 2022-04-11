import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_token/token/repositories/token_repository.dart';
import 'package:flutter_token/token/use_cases/burn.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'burn_test.mocks.dart';

@GenerateMocks([TokenRepository])
void main() {
  late Burn burn;
  late MockTokenRepository mockTokenRepository;

  setUp(() {
    mockTokenRepository = MockTokenRepository();
    burn = Burn(repository: mockTokenRepository);
  });

  test('should call burn()', () async {
    when(mockTokenRepository.burn(
      amount: anyNamed('amount'),
      address: anyNamed('address'),
    )).thenAnswer(
      (_) async => const Right(unit),
    );

    await burn(const Params(
      amount: 1000,
      address: '0x47E2935e04CdA3bAFD7e399244d430914939D544',
    ));

    verify(mockTokenRepository.burn(
      amount: anyNamed('amount'),
      address: anyNamed('address'),
    ));
  });
}
