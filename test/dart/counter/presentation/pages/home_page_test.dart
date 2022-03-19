import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_contract_counter/counter/state_managers/counter_cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_smart_contract_counter/main.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

class MockCounterCubit extends MockCubit<CounterState> implements CounterCubit {
}

class FakeCounterState extends Fake implements CounterState {}

void main() {
  late MockCounterCubit mockCounterCubit;

  setUpAll(() {
    registerFallbackValue(FakeCounterState());
  });

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    mockCounterCubit = MockCounterCubit();

    GetIt.I.registerLazySingleton<CounterCubit>(() => mockCounterCubit);
  });

  tearDown(() async {
    mockCounterCubit.close();
    await GetIt.I.reset();
  });

  testWidgets('should find text = 10', (WidgetTester tester) async {
    when(() => mockCounterCubit.state).thenReturn(CounterState(counter: 10));

    await tester.pumpWidget(const MyApp());
    await tester.pump();

    expect(find.text('10'), findsOneWidget);
  });

  testWidgets('should find 2 CircularProgressIndicator() widgets',
      (WidgetTester tester) async {
    when(() => mockCounterCubit.state)
        .thenReturn(CounterState(isLoading: true));

    await tester.pumpWidget(const MyApp());
    await tester.pump();

    expect(find.byKey(const Key('loading-key')), findsNWidgets(2));
  });

  testWidgets('should tap and call increment', (WidgetTester tester) async {
    when(() => mockCounterCubit.state).thenReturn(CounterState());
    whenListen(
      mockCounterCubit,
      Stream.fromIterable([
        CounterState(),
        CounterState(counter: 10),
      ]),
    );

    await tester.pumpWidget(const MyApp());
    
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('10'), findsOneWidget);
    verify(() => mockCounterCubit.increment());
  });

  testWidgets('should find 2 CircularProgressIndicator() widgets, when tap button',
      (WidgetTester tester) async {
    when(() => mockCounterCubit.state).thenReturn(CounterState());
    whenListen(
      mockCounterCubit,
      Stream.fromIterable([
        CounterState(),
        CounterState(isLoading: true),
      ]),
    );

    await tester.pumpWidget(const MyApp());
    
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.byKey(const Key('loading-key')), findsNWidgets(2));
    verify(() => mockCounterCubit.increment());
  });
}
