// Mocks generated by Mockito 5.3.2 from annotations
// in bwa_distribution_tracking/test/domain/usecases/user_login_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:bwa_distribution_tracking/core/error/failures.dart' as _i5;
import 'package:bwa_distribution_tracking/data/models/login_response.bv.dart'
    as _i6;
import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

import 'user_login_test.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MockAuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMockAuthRepository extends _i1.Mock
    implements _i3.MockAuthRepository {
  MockMockAuthRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.LoginResponse>> getCachedLogin() =>
      (super.noSuchMethod(
        Invocation.method(
          #getCachedLogin,
          [],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, _i6.LoginResponse>>.value(
                _FakeEither_0<_i5.Failure, _i6.LoginResponse>(
          this,
          Invocation.method(
            #getCachedLogin,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.LoginResponse>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.LoginResponse>> login(
    String? phone,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [
            phone,
            password,
          ],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, _i6.LoginResponse>>.value(
                _FakeEither_0<_i5.Failure, _i6.LoginResponse>(
          this,
          Invocation.method(
            #login,
            [
              phone,
              password,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.LoginResponse>>);
}
