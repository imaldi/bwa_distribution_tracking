// Mocks generated by Mockito 5.3.2 from annotations
// in bwa_distribution_tracking/test/data/repositories/auth_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:bwa_distribution_tracking/core/platform/network_info.dart'
    as _i3;
import 'package:bwa_distribution_tracking/data/datasources/local/auth_local_data_source.dart'
    as _i6;
import 'package:bwa_distribution_tracking/data/datasources/remote/auth_remote_data_source.dart'
    as _i5;
import 'package:bwa_distribution_tracking/data/models/login_response.bv.dart'
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
// ignore_for_file: subtype_of_sealed_class

class _FakeLoginResponse_0 extends _i1.SmartFake implements _i2.LoginResponse {
  _FakeLoginResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i3.NetworkInfo {
  @override
  _i4.Future<bool> get isConnected => (super.noSuchMethod(
        Invocation.getter(#isConnected),
        returnValue: _i4.Future<bool>.value(false),
        returnValueForMissingStub: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
}

/// A class which mocks [AuthRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRemoteDataSource extends _i1.Mock
    implements _i5.AuthRemoteDataSource {
  @override
  _i4.Future<_i2.LoginResponse> login(
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
        returnValue: _i4.Future<_i2.LoginResponse>.value(_FakeLoginResponse_0(
          this,
          Invocation.method(
            #login,
            [
              phone,
              password,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.LoginResponse>.value(_FakeLoginResponse_0(
          this,
          Invocation.method(
            #login,
            [
              phone,
              password,
            ],
          ),
        )),
      ) as _i4.Future<_i2.LoginResponse>);
}

/// A class which mocks [AuthLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthLocalDataSource extends _i1.Mock
    implements _i6.AuthLocalDataSource {
  @override
  _i4.Future<_i2.LoginResponse> getCachedLogin() => (super.noSuchMethod(
        Invocation.method(
          #getCachedLogin,
          [],
        ),
        returnValue: _i4.Future<_i2.LoginResponse>.value(_FakeLoginResponse_0(
          this,
          Invocation.method(
            #getCachedLogin,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.LoginResponse>.value(_FakeLoginResponse_0(
          this,
          Invocation.method(
            #getCachedLogin,
            [],
          ),
        )),
      ) as _i4.Future<_i2.LoginResponse>);
  @override
  _i4.Future<void> cacheLoginResponse(_i2.LoginResponse? loginResponse) =>
      (super.noSuchMethod(
        Invocation.method(
          #cacheLoginResponse,
          [loginResponse],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> deleteCachedLogin() => (super.noSuchMethod(
        Invocation.method(
          #deleteCachedLogin,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}
