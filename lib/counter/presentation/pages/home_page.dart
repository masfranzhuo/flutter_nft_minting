import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_contract_counter/counter/state_managers/counter_cubit/counter_cubit.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatelessWidget {
  final String title;
  final GetIt _getIt;

  HomePage({Key? key, required this.title})
      : _getIt = GetIt.instance,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _getIt<CounterCubit>()..get(),
      child: _builder(context),
    );
  }

  Widget _builder(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Center(
            child: (state.isLoading)
                ? const CircularProgressIndicator(key: Key('loading-key'))
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'You have pushed the button this many times:',
                      ),
                      Text(
                        '${state.counter}',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  ),
          ),
          floatingActionButton: (state.isLoading)
              ? const CircularProgressIndicator(key: Key('loading-key'))
              : FloatingActionButton(
                  onPressed: () => _getIt<CounterCubit>().increment(),
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
        );
      },
    );
  }
}
