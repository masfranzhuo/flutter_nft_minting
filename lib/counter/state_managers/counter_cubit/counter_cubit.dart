import 'package:bloc/bloc.dart';
import 'package:flutter_smart_contract_counter/core/error/failure.dart';
import 'package:flutter_smart_contract_counter/core/use_case.dart';
import 'package:flutter_smart_contract_counter/counter/use_cases/get_counter.dart';
import 'package:flutter_smart_contract_counter/counter/use_cases/increment_counter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'counter_cubit.freezed.dart';

@singleton
class CounterCubit extends Cubit<CounterState> {
  final GetCounter _getCounter;
  final IncrementCounter _incrementCounter;

  CounterCubit({
    required GetCounter getCounter,
    required IncrementCounter incrementCounter,
  })  : _getCounter = getCounter,
        _incrementCounter = incrementCounter,
        super(CounterState());

  void get() async {
    emit(state.copyWith(isLoading: true));

    final result = await _getCounter(NoParams());
    result.fold(
      (failure) => emit(state.copyWith(
        failure: failure,
        isLoading: false,
      )),
      (counter) => emit(state.copyWith(
        counter: counter,
        isLoading: false,
      )),
    );
  }

  void increment() async {
    emit(state.copyWith(isLoading: true));

    final result = await _incrementCounter(NoParams());
    result.fold(
      (failure) => emit(state.copyWith(
        failure: failure,
        isLoading: false,
      )),
      (_) => emit(state.copyWith(isLoading: false)),
    );
  }
}

@freezed
class CounterState with _$CounterState {
  const CounterState._();
  factory CounterState({
    Failure? failure,
    @Default(0) int counter,
    @Default(false) bool isLoading,
  }) = _CounterState;
}
