import 'package:dartz/dartz.dart';
import 'package:flutter_nft_minting/core/use_case.dart';
import 'package:flutter_nft_minting/nft/repositories/nft_repository.dart';
import 'package:flutter_nft_minting/nft/use_cases/get_name.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_name_test.mocks.dart';

@GenerateMocks([NFTRepository])
void main() {
  late GetName getName;
  late MockNFTRepository mockNFTRepository;

  setUp(() {
    mockNFTRepository = MockNFTRepository();
    getName = GetName(repository: mockNFTRepository);
  });

  test('should return name = "Token Name"', () async {
    when(mockNFTRepository.getName()).thenAnswer(
      (_) async => const Right('Token Name'),
    );

    final result = await getName(NoParams());

    verify(mockNFTRepository.getName());
    expect((result as Right).value, 'Token Name');
  });
}
