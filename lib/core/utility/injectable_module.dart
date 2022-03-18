import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:web3dart/web3dart.dart';

@module
abstract class InjectableModule {
  Client get http => Client();
  Web3Client get web3Client => Web3Client(
        'https://rinkeby.infura.io/v3/' + dotenv.env['INFURA_API_KEY']!,
        http,
      );
}
