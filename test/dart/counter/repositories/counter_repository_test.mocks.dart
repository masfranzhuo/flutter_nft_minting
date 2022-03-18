// Mocks generated by Mockito 5.1.0 from annotations
// in flutter_smart_contract_counter/test/dart/counter/repositories/counter_repository_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:flutter_smart_contract_counter/counter/data_sources/counter_data_source.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [CounterDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockCounterDataSource extends _i1.Mock implements _i2.CounterDataSource {
  MockCounterDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<int> getCounter() =>
      (super.noSuchMethod(Invocation.method(#getCounter, []),
          returnValue: Future<int>.value(0)) as _i3.Future<int>);
  @override
  _i3.Future<void> incrementCounter() =>
      (super.noSuchMethod(Invocation.method(#incrementCounter, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
}
