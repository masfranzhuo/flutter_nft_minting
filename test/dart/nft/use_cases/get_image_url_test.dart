import 'package:dartz/dartz.dart';
import 'package:flutter_nft_minting/nft/repositories/nft_repository.dart';
import 'package:flutter_nft_minting/nft/use_cases/get_image_url.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_image_url_test.mocks.dart';

@GenerateMocks([NFTRepository])
void main() {
  late GetImageURL getImageURL;
  late MockNFTRepository mockNFTRepository;

  setUp(() {
    mockNFTRepository = MockNFTRepository();
    getImageURL = GetImageURL(repository: mockNFTRepository);
  });

  test('should return image URL = "https://images/test.png"', () async {
    when(mockNFTRepository.getImageURL(
      tokenCounter: anyNamed('tokenCounter'),
    )).thenAnswer(
      (_) async => const Right('https://images/test.png'),
    );

    final result = await getImageURL(0);

    verify(mockNFTRepository.getImageURL(
      tokenCounter: anyNamed('tokenCounter'),
    ));
    expect((result as Right).value, 'https://images/test.png');
  });
}
