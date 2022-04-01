import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_token/token/state_managers/token_cubit/token_cubit.dart';
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
      create: (_) => _getIt<TokenCubit>()..get(),
      child: _builder(context),
    );
  }

  Widget _builder(BuildContext context) {
    return BlocBuilder<TokenCubit, TokenState>(
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
                      const Text('Token details:'),
                      Text('${state.token?.name}'),
                      Text('${state.token?.symbol}'),
                      Text('${state.token?.totalSupply}'),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () =>
                              _getIt<TokenCubit>().mint(amount: 1000),
                          child: const Text('Mint'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () =>
                              _getIt<TokenCubit>().burn(amount: 1000),
                          child: const Text('Burn'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () => _getIt<TokenCubit>().get(),
                          child: const Text('Refresh'),
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
