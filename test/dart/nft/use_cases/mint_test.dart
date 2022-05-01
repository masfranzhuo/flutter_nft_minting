import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_nft_minting/nft/repositories/nft_repository.dart';
import 'package:flutter_nft_minting/nft/use_cases/mint.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'mint_test.mocks.dart';

@GenerateMocks([NFTRepository])
void main() {
  late Mint mint;
  late MockNFTRepository mockNFTRepository;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    dotenv.testLoad(fileInput: '''
      JSON_CID = JSON_CID
    ''');

    mockNFTRepository = MockNFTRepository();
    mint = Mint(repository: mockNFTRepository);
  });

  test('should return true', () async {
    when(mockNFTRepository.mint(
      tokenURI: anyNamed('tokenURI'),
      address: anyNamed('address'),
    )).thenAnswer(
      (_) async => const Right(true),
    );

    final result = await mint(const Params(
      tokenCounter: 0,
      address: '0x0000000000000000000000000000000000000000',
    ));

    verify(mockNFTRepository.mint(
      tokenURI: anyNamed('tokenURI'),
      address: anyNamed('address'),
    ));
    expect((result as Right).value, true);
  });
}
