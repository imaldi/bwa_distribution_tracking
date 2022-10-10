// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of login_response;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return _LoginResponse.fromJson(json);
}

/// @nodoc
mixin _$LoginResponse {
  @JsonKey(name: '0')
  @HiveField(0)
  int? get responseCode => throw _privateConstructorUsedError;
  @HiveField(1)
  bool? get success => throw _privateConstructorUsedError;
  @HiveField(2)
  Token? get token => throw _privateConstructorUsedError;
  @HiveField(3)
  UserModel? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginResponseCopyWith<LoginResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginResponseCopyWith<$Res> {
  factory $LoginResponseCopyWith(
          LoginResponse value, $Res Function(LoginResponse) then) =
      _$LoginResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: '0') @HiveField(0) int? responseCode,
      @HiveField(1) bool? success,
      @HiveField(2) Token? token,
      @HiveField(3) UserModel? user});

  $TokenCopyWith<$Res>? get token;
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$LoginResponseCopyWithImpl<$Res>
    implements $LoginResponseCopyWith<$Res> {
  _$LoginResponseCopyWithImpl(this._value, this._then);

  final LoginResponse _value;
  // ignore: unused_field
  final $Res Function(LoginResponse) _then;

  @override
  $Res call({
    Object? responseCode = freezed,
    Object? success = freezed,
    Object? token = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      responseCode: responseCode == freezed
          ? _value.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as int?,
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as Token?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }

  @override
  $TokenCopyWith<$Res>? get token {
    if (_value.token == null) {
      return null;
    }

    return $TokenCopyWith<$Res>(_value.token!, (value) {
      return _then(_value.copyWith(token: value));
    });
  }

  @override
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$$_LoginResponseCopyWith<$Res>
    implements $LoginResponseCopyWith<$Res> {
  factory _$$_LoginResponseCopyWith(
          _$_LoginResponse value, $Res Function(_$_LoginResponse) then) =
      __$$_LoginResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: '0') @HiveField(0) int? responseCode,
      @HiveField(1) bool? success,
      @HiveField(2) Token? token,
      @HiveField(3) UserModel? user});

  @override
  $TokenCopyWith<$Res>? get token;
  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_LoginResponseCopyWithImpl<$Res>
    extends _$LoginResponseCopyWithImpl<$Res>
    implements _$$_LoginResponseCopyWith<$Res> {
  __$$_LoginResponseCopyWithImpl(
      _$_LoginResponse _value, $Res Function(_$_LoginResponse) _then)
      : super(_value, (v) => _then(v as _$_LoginResponse));

  @override
  _$_LoginResponse get _value => super._value as _$_LoginResponse;

  @override
  $Res call({
    Object? responseCode = freezed,
    Object? success = freezed,
    Object? token = freezed,
    Object? user = freezed,
  }) {
    return _then(_$_LoginResponse(
      responseCode: responseCode == freezed
          ? _value.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as int?,
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as Token?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }
}

/// @nodoc

@HiveType(typeId: loginResponseTypeId, adapterName: 'LoginResponseAdapter')
@JsonSerializable(explicitToJson: true)
class _$_LoginResponse implements _LoginResponse {
  const _$_LoginResponse(
      {@JsonKey(name: '0') @HiveField(0) this.responseCode,
      @HiveField(1) this.success,
      @HiveField(2) this.token,
      @HiveField(3) this.user});

  factory _$_LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$$_LoginResponseFromJson(json);

  @override
  @JsonKey(name: '0')
  @HiveField(0)
  final int? responseCode;
  @override
  @HiveField(1)
  final bool? success;
  @override
  @HiveField(2)
  final Token? token;
  @override
  @HiveField(3)
  final UserModel? user;

  @override
  String toString() {
    return 'LoginResponse(responseCode: $responseCode, success: $success, token: $token, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginResponse &&
            const DeepCollectionEquality()
                .equals(other.responseCode, responseCode) &&
            const DeepCollectionEquality().equals(other.success, success) &&
            const DeepCollectionEquality().equals(other.token, token) &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(responseCode),
      const DeepCollectionEquality().hash(success),
      const DeepCollectionEquality().hash(token),
      const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$$_LoginResponseCopyWith<_$_LoginResponse> get copyWith =>
      __$$_LoginResponseCopyWithImpl<_$_LoginResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoginResponseToJson(
      this,
    );
  }
}

abstract class _LoginResponse implements LoginResponse {
  const factory _LoginResponse(
      {@JsonKey(name: '0') @HiveField(0) final int? responseCode,
      @HiveField(1) final bool? success,
      @HiveField(2) final Token? token,
      @HiveField(3) final UserModel? user}) = _$_LoginResponse;

  factory _LoginResponse.fromJson(Map<String, dynamic> json) =
      _$_LoginResponse.fromJson;

  @override
  @JsonKey(name: '0')
  @HiveField(0)
  int? get responseCode;
  @override
  @HiveField(1)
  bool? get success;
  @override
  @HiveField(2)
  Token? get token;
  @override
  @HiveField(3)
  UserModel? get user;
  @override
  @JsonKey(ignore: true)
  _$$_LoginResponseCopyWith<_$_LoginResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
