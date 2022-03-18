import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_smart_contract_counter/core/platform/smart_contract_web3_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:web3dart/web3dart.dart';

import 'smart_contract_web3_client_test.mocks.dart';

@GenerateMocks(
  [],
  customMocks: [
    MockSpec<Client>(returnNullOnMissingStub: true),
    MockSpec<Web3Client>(returnNullOnMissingStub: true),
  ],
)
void main() {
  late SmartContractWeb3Client client;
  late MockClient mockHttpClient;
  late MockWeb3Client mockWeb3Client;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await dotenv.load();

    mockHttpClient = MockClient();
    mockWeb3Client = MockWeb3Client();
    client = SmartContractWeb3Client(
      httpClient: mockHttpClient,
      web3client: mockWeb3Client,
    );
  });

  group('getContract', () {
    test('should return contract', () async {
      await client.getContract(
        contractName: 'Counter',
        contractFileLocation: 'src/artifacts/Counter.json',
      );
    });
  });

  group('callContract', () {
    test('should return result = 1', () async {
      when(mockWeb3Client.call(
        contract: anyNamed('contract'),
        function: anyNamed('function'),
        params: anyNamed('params'),
      )).thenAnswer((_) async => [1]);

      // final result = await client.callContract(
      //   contractName: 'Counter',
      //   contractFileLocation: 'src/artifacts/Counter.json',
      //   functionName: 'counter',
      // );
    });
  });

  group('sendTransaction', () {
    test('should call sendTransaction()', () async {
      when(
        mockWeb3Client.sendTransaction(any, any, chainId: anyNamed('chainId')),
      ).thenAnswer((_) async => 'any result');

      // final result = await client.sendTransaction(
      //   contractName: 'Counter',
      //   contractFileLocation: 'src/artifacts/Counter.json',
      //   functionName: 'counter',
      // );
    });
  });
}
