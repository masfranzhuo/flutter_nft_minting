import 'package:dartz/dartz.dart';
import 'package:flutter_nft_minting/core/use_case.dart';
import 'package:flutter_nft_minting/nft/repositories/nft_repository.dart';
import 'package:flutter_nft_minting/nft/use_cases/get_contract.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:web3dart/contracts.dart';

import 'get_contract_test.mocks.dart';

@GenerateMocks([NFTRepository, DeployedContract])
void main() {
  late GetContract getContract;
  late MockNFTRepository mockNFTRepository;
  late MockDeployedContract mockDeployedContract;

  setUp(() {
    mockNFTRepository = MockNFTRepository();
    mockDeployedContract = MockDeployedContract();
    getContract = GetContract(repository: mockNFTRepository);
  });

  test('should return contract', () async {
    when(mockNFTRepository.getContract()).thenAnswer(
      (_) async => Right(mockDeployedContract),
    );

    final result = await getContract(NoParams());

    verify(mockNFTRepository.getContract());
    expect((result as Right).value, mockDeployedContract);
  });
}
