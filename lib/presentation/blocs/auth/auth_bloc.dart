import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bwa_distribution_tracking/core/params/login_params.dart';
import 'package:bwa_distribution_tracking/data/models/login_response.bv.dart';
import 'package:bwa_distribution_tracking/domain/usecases/user_login.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserLoginUseCase userLogin;

  AuthBloc({required this.userLogin}) : super(AuthInitial()) {
    on<UserLoginAuthEvent>((event, emit) async {
      emit(AuthLoading());

      var failOrLoaded = await userLogin(
          LoginParams(phone: event.phone, password: event.password));

      var currentState = failOrLoaded.fold((failure) => AuthFailed()..theErrorIs = "${failure.runtimeType}",
          (loginResponse) => AuthLoaded(loginResponse: loginResponse));

      emit(currentState);
    });
  }
}
