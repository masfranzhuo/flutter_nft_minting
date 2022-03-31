import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_token/my_app.dart';
import 'package:flutter_token/token/state_managers/token_cubit/token_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

class MockTokenCubit extends MockCubit<TokenState> implements TokenCubit {}

class FakeTokenState extends Fake implements TokenState {}

void main() {
  late MockTokenCubit mockTokenCubit;

  setUpAll(() {
    registerFallbackValue(FakeTokenState());
  });

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    mockTokenCubit = MockTokenCubit();

    GetIt.I.registerLazySingleton<TokenCubit>(() => mockTokenCubit);
  });

  tearDown(() async {
    mockTokenCubit.close();
    await GetIt.I.reset();
  });

  testWidgets('should find text = 10', (WidgetTester tester) async {
    when(() => mockTokenCubit.state).thenReturn(TokenState());

    await tester.pumpWidget(const MyApp());
    await tester.pump();
  });
}
