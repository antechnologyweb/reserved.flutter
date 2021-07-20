import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:btime/models/reservation_model.dart';
import 'package:btime/models/user_model.dart';
import 'package:btime/data/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authorization_event.dart';
part 'authorization_state.dart';
part 'authorization_bloc.freezed.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  AuthorizationBloc(this.authenticationRepository)
      : super(AuthorizationState.unauthorized());

  final AuthenticationRepository authenticationRepository;

  @override
  Stream<AuthorizationState> mapEventToState(
    AuthorizationEvent event,
  ) async* {
    if (event is LoginSubmit) {
      try {
        yield AuthorizationState.loading();
        final user = await authenticationRepository.login(event.body);
        if (user != null) {
          final bookings =
              await authenticationRepository.userBookingHistory(user.id);
          yield AuthorizationState.authorized(
              User(
                  user.id, user.token, user.name, '${user.avatar}', user.phone));
        } else
          throw Exception('Не удалось авторизоваться');
      } on Exception catch (err) {
        print('${err.toString().replaceRange(0, 9, '')}');

        yield AuthorizationState.error(
            "Не правильный пароль или номер телефона");
        yield AuthorizationState.unauthorized();
      }
    } else if (event is RegisterSubmit) {
      try {
        yield AuthorizationState.loading();
        final user = await authenticationRepository.register(event.body);
        print(user);
        if (user != null) {

          yield AuthorizationState.authorized(
              User(
                  user.id, user.token, user.name, '${user.avatar}', user.phone));
        } else {
          throw Exception('Номер уже занят');
        }
      } on Exception catch (err) {
        print('${err.toString().replaceRange(0, 9, '')}');

        yield AuthorizationState.error(err.toString().replaceRange(0, 11, ''));
        yield AuthorizationState.unauthorized();
      }
    } else if (event is LoginViaTokenSubmit) {
      try {
        final user = await authenticationRepository.loginViaToken();
        // final bookings =
        //     await authenticationRepository.userBookingHistory(user.id);
        if (user != User.empty)
          yield AuthorizationState.authorized(
              User(
                  user.id, user.token, user.name, '${user.avatar}', user.phone));
      } catch (err) {
        yield AuthorizationState.error(err.toString());
        yield AuthorizationState.unauthorized();
      }
    } else if (event is LogOutSubmit) {
      yield AuthorizationState.unauthorized();
    }
  }
}
