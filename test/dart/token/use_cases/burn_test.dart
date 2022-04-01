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
    when(mockTokenRepository.burn(amount: anyNamed('amount'))).thenAnswer(
      (_) async => const Right(unit),
    );

    await burn(1000);

    verify(mockTokenRepository.burn(amount: anyNamed('amount')));
  });
}
