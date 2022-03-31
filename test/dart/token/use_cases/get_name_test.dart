import 'package:dartz/dartz.dart';
import 'package:flutter_token/core/use_case.dart';
import 'package:flutter_token/token/repositories/token_repository.dart';
import 'package:flutter_token/token/use_cases/get_name.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_name_test.mocks.dart';

@GenerateMocks([TokenRepository])
void main() {
  late GetName getName;
  late MockTokenRepository mockTokenRepository;

  setUp(() {
    mockTokenRepository = MockTokenRepository();
    getName = GetName(repository: mockTokenRepository);
  });

  test('should return name = "Token Name"', () async {
    when(mockTokenRepository.getName()).thenAnswer(
      (_) async => const Right('Token Name'),
    );

    final result = await getName(NoParams());

    verify(mockTokenRepository.getName());
    expect((result as Right).value, 'Token Name');
  });
}
