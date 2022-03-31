import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_token/main.config.dart';
import 'package:flutter_token/my_app.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

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
