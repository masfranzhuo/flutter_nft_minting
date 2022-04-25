// Mocks generated by Mockito 5.1.0 from annotations
// in flutter_nft_minting/test/dart/nft/use_cases/get_token_counter_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:flutter_nft_minting/core/error/failure.dart' as _i5;
import 'package:flutter_nft_minting/nft/repositories/nft_repository.dart'
    as _i3;
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

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [NFTRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockNFTRepository extends _i1.Mock implements _i3.NFTRepository {
  MockNFTRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, String>> getName() =>
      (super.noSuchMethod(Invocation.method(#getName, []),
              returnValue: Future<_i2.Either<_i5.Failure, String>>.value(
                  _FakeEither_0<_i5.Failure, String>()))
          as _i4.Future<_i2.Either<_i5.Failure, String>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, String>> getSymbol() =>
      (super.noSuchMethod(Invocation.method(#getSymbol, []),
              returnValue: Future<_i2.Either<_i5.Failure, String>>.value(
                  _FakeEither_0<_i5.Failure, String>()))
          as _i4.Future<_i2.Either<_i5.Failure, String>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, int>> getTokenCounter() =>
      (super.noSuchMethod(Invocation.method(#getTokenCounter, []),
              returnValue: Future<_i2.Either<_i5.Failure, int>>.value(
                  _FakeEither_0<_i5.Failure, int>()))
          as _i4.Future<_i2.Either<_i5.Failure, int>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, String>> mint(
          {String? tokenURI, String? address, int? tokenCounter}) =>
      (super.noSuchMethod(
              Invocation.method(#mint, [], {
                #tokenURI: tokenURI,
                #address: address,
                #tokenCounter: tokenCounter
              }),
              returnValue: Future<_i2.Either<_i5.Failure, String>>.value(
                  _FakeEither_0<_i5.Failure, String>()))
          as _i4.Future<_i2.Either<_i5.Failure, String>>);
}
