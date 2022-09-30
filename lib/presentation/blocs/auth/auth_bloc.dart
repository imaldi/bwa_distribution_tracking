import 'package:bwa_distribution_tracking/core/params/no_params.dart';
import 'package:bwa_distribution_tracking/domain/usecases/check_user_login_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bwa_distribution_tracking/core/params/login_params.dart';
import 'package:bwa_distribution_tracking/data/models/login_response.bv.dart';
import 'package:bwa_distribution_tracking/domain/usecases/user_login.dart';
import 'package:equatable/equatable.dart';
// import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserLoginUseCase userLogin;
  final CheckUserLoginStatusUseCase checkUserLoginStatusUseCase;

  AuthBloc({
    required this.userLogin,
    required this.checkUserLoginStatusUseCase
  }) : super(AuthInitial()) {
    on<GetCachedLoginEvent>((event, emit)async {
      emit(AuthLoading());

      var failOrLoaded = await checkUserLoginStatusUseCase(NoParams());

      var currentState = failOrLoaded.fold(
              (failure) => AuthNoCachedData(errorMessage: "${failure.runtimeType}"),
              (loginResponse) => AuthLoaded(loginResponse: loginResponse));
      emit(currentState);
    });
    on<UserLoginAuthEvent>((event, emit) async {
      emit(AuthLoading());

      var failOrLoaded = await userLogin(
          LoginParams(phone: event.phone, password: event.password));

      var currentState = failOrLoaded.fold(
          (failure) => AuthFailed(errorMessage: "${failure.runtimeType}"),
          (loginResponse) => AuthLoaded(loginResponse: loginResponse));
      emit(currentState);
    });
  }
}
