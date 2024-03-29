import 'package:bwa_distribution_tracking/core/error/failures.dart';
import 'package:bwa_distribution_tracking/core/params/login_params.dart';
import 'package:bwa_distribution_tracking/data/models/auth/login_response.dart';
import 'package:bwa_distribution_tracking/data/models/auth/token.dart';
import 'package:bwa_distribution_tracking/data/models/auth/user_model.dart';
import 'package:bwa_distribution_tracking/domain/usecases/auth/check_user_login_status.dart';
import 'package:bwa_distribution_tracking/domain/usecases/auth/user_login.dart';
import 'package:bwa_distribution_tracking/domain/usecases/auth/user_logout.dart';
import 'package:bwa_distribution_tracking/presentation/state_management/blocs/auth/auth_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([
  MockSpec<UserLoginUseCase>(),
  MockSpec<CheckUserLoginStatusUseCase>(),
  MockSpec<UserLogoutUseCase>(),
])
import 'auth_bloc_test.mocks.dart';

void main() {
  late AuthBloc bloc;
  late MockUserLoginUseCase mockUserLogin;
  late MockCheckUserLoginStatusUseCase mockCheckUserLoginStatusUseCase;
  late MockUserLogoutUseCase mockUserLogout;

  /// TODO test mockCheckUserLoginStatusUseCase
  setUp(() {
    mockUserLogin = MockUserLoginUseCase();
    mockCheckUserLoginStatusUseCase = MockCheckUserLoginStatusUseCase();
    mockUserLogout = MockUserLogoutUseCase();

    bloc = AuthBloc(
        userLogin: mockUserLogin,
        checkUserLoginStatusUseCase: mockCheckUserLoginStatusUseCase,
        userLogout: mockUserLogout);
  });

  test('initialState should be Empty', () {
    // assert
    expect(bloc.state, equals(AuthInitial()));
  });

  group('UserLogin', () {
    const tPhone = '082233539949';
    const tPassword = 'asdfgh';
    const tUserModel = UserModel(id: 1,
        name: "Majid",
        phone: "087887789889");

    const tLoginResponse = LoginResponse(responseCode: 200,
        success: true,
        token: Token(token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9"),
        user: tUserModel);

    void setUpMockGetConcreteTriviaSuccess() => when(mockUserLogin(any))
        // TODO check disini kenapa ga bisa pakai const
        .thenAnswer((_) async => Right(tLoginResponse));

    test(
      'should get data from the login use case',
      () async {
        /// arrange
        setUpMockGetConcreteTriviaSuccess();

        /// act
        bloc.add(const UserLoginAuthEvent(tPhone, tPassword));
        await untilCalled(mockUserLogin.call(any));

        /// assert
        verify(mockUserLogin
            .call(const LoginParams(phone: tPhone, password: tPassword)));
      },
    );

    test(
      'should emit [Loading, Loaded] when data is gotten successfully',
      () async {
        /// arrange
        when(mockUserLogin.call(any))
            .thenAnswer((_) async => Right(tLoginResponse));

        /// act
        bloc.add(const UserLoginAuthEvent(tPhone, tPassword));
        await untilCalled(mockUserLogin.call(any));
        expect(bloc.state, AuthLoading());

        await untilCalled(mockUserLogin.call(any));
        expect(bloc.state, AuthSuccess(loginResponse: tLoginResponse));
      },
    );

    test(
      'should emit [Loading, Failed] when getting data fails',
      () async {
        /// arrange
        when(mockUserLogin.call(any))
            .thenAnswer((_) async => Left(ServerFailure()));

        /// act
        bloc.add(const UserLoginAuthEvent(tPhone, tPassword));

        /// assert
        await untilCalled(mockUserLogin.call(any));
        expect(bloc.state, AuthLoading());

        await untilCalled(mockUserLogin.call(any));
        expect(bloc.state,
            AuthFailed(ServerFailure(), errorMessage: "${ServerFailure().runtimeType}"));
      },
    );
  });
}
