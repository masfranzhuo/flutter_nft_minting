import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_smart_contract_counter/counter/state_managers/counter_cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

class MockCounterCubit extends MockCubit<CounterState> implements CounterCubit {
}

void main() {
  late MockCounterCubit mockCounterCubit;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    mockCounterCubit = MockCounterCubit();

    GetIt.I.registerLazySingleton<CounterCubit>(() => mockCounterCubit);
  });

  tearDown(() async {
    mockCounterCubit.close();
    await GetIt.I.reset();
  });

  // testWidgets('should return ', (WidgetTester tester) async {
  //   when(mockCounterCubit.state).thenReturn(CounterState());

  //   await tester.pumpWidget(const MyApp());
  // });
  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(const MyApp());

  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);

  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();

  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });
}
