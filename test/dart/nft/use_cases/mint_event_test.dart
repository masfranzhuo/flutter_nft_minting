import 'package:dartz/dartz.dart';
import 'package:flutter_nft_minting/core/platform/smart_contract_web3_client.dart';
import 'package:flutter_nft_minting/nft/repositories/nft_repository.dart';
import 'package:flutter_nft_minting/nft/use_cases/mint_event.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:web3dart/contracts.dart';

import 'mint_event_test.mocks.dart';

@GenerateMocks([NFTRepository, DeployedContract, EventParams])
void main() {
  late MintEvent mintEvent;
  late MockNFTRepository mockNFTRepository;
  late MockDeployedContract mockDeployedContract;
  late MockEventParams mockEventParams;

  setUp(() {
    mockNFTRepository = MockNFTRepository();
    mockDeployedContract = MockDeployedContract();
    mockEventParams = MockEventParams();
    mintEvent = MintEvent(repository: mockNFTRepository);
  });

  test('should return eventParams', () async {
    when(mockNFTRepository.mintEvent(
      contract: anyNamed('contract'),
    )).thenAnswer((_) async => Right(mockEventParams));

    final result = await mintEvent(mockDeployedContract);

    verify(mockNFTRepository.mintEvent(contract: anyNamed('contract')));
    expect((result as Right).value, mockEventParams);
  });
}
