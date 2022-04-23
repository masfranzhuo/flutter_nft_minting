import 'package:dartz/dartz.dart';
import 'package:flutter_nft_minting/core/use_case.dart';
import 'package:flutter_nft_minting/nft/repositories/nft_repository.dart';
import 'package:flutter_nft_minting/nft/use_cases/get_symbol.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_symbol_test.mocks.dart';

@GenerateMocks([NFTRepository])
void main() {
  late GetSymbol getSymbol;
  late MockNFTRepository mockNFTRepository;

  setUp(() {
    mockNFTRepository = MockNFTRepository();
    getSymbol = GetSymbol(repository: mockNFTRepository);
  });

  test('should return symbol = "FNM"', () async {
    when(mockNFTRepository.getSymbol()).thenAnswer(
      (_) async => const Right('FNM'),
    );

    final result = await getSymbol(NoParams());

    verify(mockNFTRepository.getSymbol());
    expect((result as Right).value, 'FNM');
  });
}
