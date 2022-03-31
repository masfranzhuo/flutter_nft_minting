import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_token/token/entities/token.dart';

void main() {
  final tokenFixture = Token(
    name: 'Token Name',
    symbol: 'TN',
    totalSupply: 1000
  );
  final tokenJson = <String, dynamic>{
    'name': 'Token Name',
    'symbol': 'TN',
    'totalSupply': 1000,
  };
  
  test('fromJson', () {
    expect(Token.fromJson(tokenJson), tokenFixture);
  });
}
