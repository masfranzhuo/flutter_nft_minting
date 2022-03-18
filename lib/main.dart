import 'package:flutter/material.dart';
import 'package:flutter_smart_contract_counter/counter/presentation/pages/home_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_smart_contract_counter/main.config.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Flutter Smart Contract'),
    );
  }
}
