part of 'authorization_bloc.dart';

@freezed
class AuthorizationState with _$AuthorizationState {
  const factory AuthorizationState.initial() = AuthInitialState;
  const factory AuthorizationState.loading() = AuthLoadingState;
  const factory AuthorizationState.authorized(User user) = Authenticated;
  const factory AuthorizationState.unauthorized() = Unauthenticated;
  const factory AuthorizationState.error([String? message]) = AuthErrorState;
}
