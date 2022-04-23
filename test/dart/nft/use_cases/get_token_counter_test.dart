import 'package:dartz/dartz.dart';
import 'package:flutter_nft_minting/core/use_case.dart';
import 'package:flutter_nft_minting/nft/repositories/nft_repository.dart';
import 'package:flutter_nft_minting/nft/use_cases/get_token_counter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_token_counter_test.mocks.dart';

@GenerateMocks([NFTRepository])
void main() {
  late GetTokenCounter getTokenCounter;
  late MockNFTRepository mockNFTRepository;

  setUp(() {
    mockNFTRepository = MockNFTRepository();
    getTokenCounter = GetTokenCounter(repository: mockNFTRepository);
  });

  test('should return token counter = 1', () async {
    when(mockNFTRepository.getTokenCounter()).thenAnswer(
      (_) async => const Right(1),
    );

    final result = await getTokenCounter(NoParams());

    verify(mockNFTRepository.getTokenCounter());
    expect((result as Right).value, 1);
  });
}
