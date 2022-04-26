import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_nft_minting/core/utility/get_image_from_json.dart';
import 'package:flutter_nft_minting/nft/state_managers/nft_cubit/nft_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      create: (_) => _getIt<NFTCubit>()..get(),
      child: _builder(context),
    );
  }

  Widget _builder(BuildContext context) {
    return BlocBuilder<NFTCubit, NFTState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: (state.isLoading)
              ? const CircularProgressIndicator()
              : Column(
                  children: [
                    Text('Contract Address: ${dotenv.env['CONTRACT_ADDRESS']}'),
                    Text('Name: ${state.name}'),
                    Text('Symbol: ${state.symbol}'),
                    Text('Number of NFT: ${state.tokenCounter}'),
                    ElevatedButton(
                      onPressed: () => _getIt<NFTCubit>().mint(
                        tokenCounter: state.tokenCounter,
                        address: '0x1cb728ab78fcf1d8688ddad7fc6aeb2cba96c15f',
                      ),
                      child: const Text('Mint'),
                    ),
                    state.imageUrl != null
                        ? Image.network(
                            getImageFromJson(state.imageUrl!),
                            width: 256,
                            height: 256,
                          )
                        : Container(),
                  ],
                ),
        ),
      );
    });
  }
}
