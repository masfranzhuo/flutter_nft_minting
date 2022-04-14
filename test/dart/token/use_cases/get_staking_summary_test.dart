import 'package:dartz/dartz.dart';
import 'package:flutter_token/token/repositories/token_repository.dart';
import 'package:flutter_token/token/use_cases/get_staking_summary.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../entities/entity_helpers.dart';
import 'get_staking_summary_test.mocks.dart';

@GenerateMocks([TokenRepository])
void main() {
  late GetStakingSummary getStakingSummary;
  late MockTokenRepository mockTokenRepository;

  setUp(() {
    mockTokenRepository = MockTokenRepository();
    getStakingSummary = GetStakingSummary(repository: mockTokenRepository);
  });

  test('should return staking summary', () async {
    when(mockTokenRepository.getStakingSummary(
      address: anyNamed('address'),
    )).thenAnswer(
      (_) async => Right(stakingSummaryFixture),
    );

    final result = await getStakingSummary(const Params(
      address: '0x47e2935e04cda3bafd7e399244d430914939d544',
    ));

    verify(mockTokenRepository.getStakingSummary(
      address: anyNamed('address'),
    ));
    expect((result as Right).value, stakingSummaryFixture);
  });
}
