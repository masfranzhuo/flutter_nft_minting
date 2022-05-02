import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_nft_minting/core/error/failure.dart';
import 'package:flutter_nft_minting/core/platform/smart_contract_web3_client.dart';
import 'package:flutter_nft_minting/nft/state_managers/nft_bloc/nft_bloc.dart';
import 'package:flutter_nft_minting/nft/use_cases/get_contract.dart';
import 'package:flutter_nft_minting/nft/use_cases/get_name.dart';
import 'package:flutter_nft_minting/nft/use_cases/get_symbol.dart';
import 'package:flutter_nft_minting/nft/use_cases/get_token_counter.dart';
import 'package:flutter_nft_minting/nft/use_cases/mint.dart';
import 'package:flutter_nft_minting/nft/use_cases/mint_event.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:web3dart/contracts.dart';

import 'nft_bloc_test.mocks.dart';

@GenerateMocks([
  GetName,
  GetSymbol,
  GetTokenCounter,
  GetContract,
  Mint,
  MintEvent,
  DeployedContract,
  EventParams,
])
void main() {
  late NftBloc bloc;
  late MockGetName mockGetName;
  late MockGetSymbol mockGetSymbol;
  late MockGetTokenCounter mockGetTokenCounter;
  late MockGetContract mockGetContract;
  late MockMint mockMint;
  late MockMintEvent mockMintEvent;
  late MockDeployedContract mockDeployedContract;
  late MockEventParams mockEventParams;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    dotenv.testLoad(fileInput: '''
      JSON_CID = JSON_CID
      IMAGES_CID = IMAGES_CID
    ''');

    mockGetName = MockGetName();
    mockGetSymbol = MockGetSymbol();
    mockGetTokenCounter = MockGetTokenCounter();
    mockGetContract = MockGetContract();
    mockMint = MockMint();
    mockMintEvent = MockMintEvent();
    mockDeployedContract = MockDeployedContract();
    mockEventParams = MockEventParams();
    bloc = NftBloc(
      getName: mockGetName,
      getSymbol: mockGetSymbol,
      getTokenCounter: mockGetTokenCounter,
      getContract: mockGetContract,
      mint: mockMint,
      mintEvent: mockMintEvent,
    );
  });

  group('getNftEvent', () {
    blocTest(
      'should emit name, symbol and tokenCounter',
      build: () {
        when(mockGetName(any)).thenAnswer(
          (_) async => const Right('Token Name'),
        );
        when(mockGetSymbol(any)).thenAnswer(
          (_) async => const Right('FNM'),
        );
        when(mockGetTokenCounter(any)).thenAnswer(
          (_) async => const Right(1000),
        );

        return bloc;
      },
      act: (_) async => bloc.add(const NftEvent.get()),
      expect: () => [
        NftState(isLoading: true),
        NftState(
          isLoading: false,
          name: 'Token Name',
          symbol: 'FNM',
          tokenCounter: 1000,
        ),
      ],
      verify: (_) async {
        verify(mockGetName(any));
        verify(mockGetSymbol(any));
        verify(mockGetTokenCounter(any));
      },
    );
  });

  group('getContractNftEvent', () {
    blocTest(
      'should emit failure',
      build: () {
        when(mockGetContract(any)).thenAnswer(
          (_) async => const Left(UnexpectedFailure()),
        );

        return bloc;
      },
      act: (_) async => bloc.add(const NftEvent.getContract()),
      expect: () => [
        NftState(isLoading: true),
        NftState(
          isLoading: false,
          failure: const UnexpectedFailure(),
        ),
      ],
      verify: (_) async {
        verify(mockGetContract(any));
      },
    );
    blocTest(
      'should emit contract',
      build: () {
        when(mockGetContract(any)).thenAnswer(
          (_) async => Right(mockDeployedContract),
        );

        return bloc;
      },
      act: (_) async => bloc.add(const NftEvent.getContract()),
      expect: () => [
        NftState(isLoading: true),
        NftState(isLoading: false, contract: mockDeployedContract),
      ],
      verify: (_) async {
        verify(mockGetContract(any));
      },
    );
  });

  group('mintNftEvent', () {
    blocTest(
      'should emit failure',
      build: () {
        when(mockMint(any)).thenAnswer(
          (_) async => const Left(UnexpectedFailure()),
        );

        return bloc;
      },
      act: (_) async => bloc.add(NftEvent.mint(
        contract: mockDeployedContract,
        tokenCounter: 0,
        address: '0x0000000000000000000000000000000000000000',
      )),
      expect: () => [
        NftState(isLoading: true),
        NftState(
          isLoading: false,
          failure: const UnexpectedFailure(),
        ),
      ],
      verify: (_) async {
        verify(mockMint(any));
      },
    );
    // blocTest(
    //   'should emit isGettingImage = true',
    //   build: () {
    //     when(mockMint(any)).thenAnswer(
    //       (_) async => const Right(true),
    //     );
    //     when(mockMintEvent(any)).thenAnswer(
    //       (_) async => Right(mockEventParams),
    //     );

    //     return bloc;
    //   },
    //   act: (_) async => bloc.add(NftEvent.mint(
    //     contract: mockDeployedContract,
    //     tokenCounter: 0,
    //     address: '0x0000000000000000000000000000000000000000',
    //   )),
    //   expect: () => [
    //     NftState(isLoading: true),
    //     NftState(isLoading: false, isGettingImage: true),
    //   ],
    //   verify: (_) async {
    //     verify(mockMint(any));
    //     verify(mockMintEvent(any));
    //   },
    // );
  });

  group('getImageURLNftEvent', () {
    blocTest(
      'should emit imageUrl = "https://gateway.pinata.cloud/ipfs/IMAGES_CID/test.png"',
      build: () {
        return bloc;
      },
      act: (_) async => bloc.add(const NftEvent.getImageURL(
        imageJson: 'ipfs://JSON_CID/test.json',
      )),
      expect: () => [
        NftState(
          isLoading: false,
          isGettingImage: false,
          imageURL: 'https://gateway.pinata.cloud/ipfs/IMAGES_CID/test.png',
        ),
      ],
    );
  });
}
