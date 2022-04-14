import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_token/token/entities/stake.dart';
import 'package:flutter_token/token/entities/staking_summary.dart';
import 'package:flutter_token/token/entities/token.dart';

import 'entity_helpers.dart';

void main() {
  group('Token', () {
    test('fromJson', () {
      expect(Token.fromJson(tokenJson), tokenFixture);
    });
  });

  group('Stake', () {
    test('fromJson', () {
      expect(Stake.fromJson(stakeJson), stakeFixture);
    });
  });

  group('StakingSummary', () {
    test('fromJson', () {
      expect(
        StakingSummary.fromJson(stakingSummaryJson),
        stakingSummaryFixture,
      );
    });
  });
}
