import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatelessWidget {
  final String title;
  final GetIt _getIt;

  HomePage({Key? key, required this.title})
      : _getIt = GetIt.instance,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _builder(context);
  }

  Widget _builder(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Center(),
    );
  }
}
