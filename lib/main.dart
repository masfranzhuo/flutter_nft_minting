import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_nft_minting/my_app.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'main.config.dart';

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  $initGetIt(GetIt.instance);
  runApp(const MyApp());
}
