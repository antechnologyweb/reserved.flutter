// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'authorization_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthorizationStateTearOff {
  const _$AuthorizationStateTearOff();

  AuthInitialState initial() {
    return const AuthInitialState();
  }

  AuthLoadingState loading() {
    return const AuthLoadingState();
  }

  Authenticated authorized(User user, {List<Booking>? bookingList}) {
    return Authenticated(
      user,
      bookingList: bookingList,
    );
  }

  Unauthenticated unauthorized() {
    return const Unauthenticated();
  }

  AuthErrorState error([String? message]) {
    return AuthErrorState(
      message,
    );
  }
}

/// @nodoc
const $AuthorizationState = _$AuthorizationStateTearOff();

/// @nodoc
mixin _$AuthorizationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(User user, List<Booking>? bookingList) authorized,
    required TResult Function() unauthorized,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(User user, List<Booking>? bookingList)? authorized,
    TResult Function()? unauthorized,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitialState value) initial,
    required TResult Function(AuthLoadingState value) loading,
    required TResult Function(Authenticated value) authorized,
    required TResult Function(Unauthenticated value) unauthorized,
    required TResult Function(AuthErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitialState value)? initial,
    TResult Function(AuthLoadingState value)? loading,
    TResult Function(Authenticated value)? authorized,
    TResult Function(Unauthenticated value)? unauthorized,
    TResult Function(AuthErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorizationStateCopyWith<$Res> {
  factory $AuthorizationStateCopyWith(
          AuthorizationState value, $Res Function(AuthorizationState) then) =
      _$AuthorizationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthorizationStateCopyWithImpl<$Res>
    implements $AuthorizationStateCopyWith<$Res> {
  _$AuthorizationStateCopyWithImpl(this._value, this._then);

  final AuthorizationState _value;
  // ignore: unused_field
  final $Res Function(AuthorizationState) _then;
}

/// @nodoc
abstract class $AuthInitialStateCopyWith<$Res> {
  factory $AuthInitialStateCopyWith(
          AuthInitialState value, $Res Function(AuthInitialState) then) =
      _$AuthInitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthInitialStateCopyWithImpl<$Res>
    extends _$AuthorizationStateCopyWithImpl<$Res>
    implements $AuthInitialStateCopyWith<$Res> {
  _$AuthInitialStateCopyWithImpl(
      AuthInitialState _value, $Res Function(AuthInitialState) _then)
      : super(_value, (v) => _then(v as AuthInitialState));

  @override
  AuthInitialState get _value => super._value as AuthInitialState;
}

/// @nodoc

class _$AuthInitialState implements AuthInitialState {
  const _$AuthInitialState();

  @override
  String toString() {
    return 'AuthorizationState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AuthInitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(User user, List<Booking>? bookingList) authorized,
    required TResult Function() unauthorized,
    required TResult Function(String? message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(User user, List<Booking>? bookingList)? authorized,
    TResult Function()? unauthorized,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitialState value) initial,
    required TResult Function(AuthLoadingState value) loading,
    required TResult Function(Authenticated value) authorized,
    required TResult Function(Unauthenticated value) unauthorized,
    required TResult Function(AuthErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitialState value)? initial,
    TResult Function(AuthLoadingState value)? loading,
    TResult Function(Authenticated value)? authorized,
    TResult Function(Unauthenticated value)? unauthorized,
    TResult Function(AuthErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AuthInitialState implements AuthorizationState {
  const factory AuthInitialState() = _$AuthInitialState;
}

/// @nodoc
abstract class $AuthLoadingStateCopyWith<$Res> {
  factory $AuthLoadingStateCopyWith(
          AuthLoadingState value, $Res Function(AuthLoadingState) then) =
      _$AuthLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthLoadingStateCopyWithImpl<$Res>
    extends _$AuthorizationStateCopyWithImpl<$Res>
    implements $AuthLoadingStateCopyWith<$Res> {
  _$AuthLoadingStateCopyWithImpl(
      AuthLoadingState _value, $Res Function(AuthLoadingState) _then)
      : super(_value, (v) => _then(v as AuthLoadingState));

  @override
  AuthLoadingState get _value => super._value as AuthLoadingState;
}

/// @nodoc

class _$AuthLoadingState implements AuthLoadingState {
  const _$AuthLoadingState();

  @override
  String toString() {
    return 'AuthorizationState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AuthLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(User user, List<Booking>? bookingList) authorized,
    required TResult Function() unauthorized,
    required TResult Function(String? message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(User user, List<Booking>? bookingList)? authorized,
    TResult Function()? unauthorized,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitialState value) initial,
    required TResult Function(AuthLoadingState value) loading,
    required TResult Function(Authenticated value) authorized,
    required TResult Function(Unauthenticated value) unauthorized,
    required TResult Function(AuthErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitialState value)? initial,
    TResult Function(AuthLoadingState value)? loading,
    TResult Function(Authenticated value)? authorized,
    TResult Function(Unauthenticated value)? unauthorized,
    TResult Function(AuthErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AuthLoadingState implements AuthorizationState {
  const factory AuthLoadingState() = _$AuthLoadingState;
}

/// @nodoc
abstract class $AuthenticatedCopyWith<$Res> {
  factory $AuthenticatedCopyWith(
          Authenticated value, $Res Function(Authenticated) then) =
      _$AuthenticatedCopyWithImpl<$Res>;
  $Res call({User user, List<Booking>? bookingList});
}

/// @nodoc
class _$AuthenticatedCopyWithImpl<$Res>
    extends _$AuthorizationStateCopyWithImpl<$Res>
    implements $AuthenticatedCopyWith<$Res> {
  _$AuthenticatedCopyWithImpl(
      Authenticated _value, $Res Function(Authenticated) _then)
      : super(_value, (v) => _then(v as Authenticated));

  @override
  Authenticated get _value => super._value as Authenticated;

  @override
  $Res call({
    Object? user = freezed,
    Object? bookingList = freezed,
  }) {
    return _then(Authenticated(
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      bookingList: bookingList == freezed
          ? _value.bookingList
          : bookingList // ignore: cast_nullable_to_non_nullable
              as List<Booking>?,
    ));
  }
}

/// @nodoc

class _$Authenticated implements Authenticated {
  const _$Authenticated(this.user, {this.bookingList});

  @override
  final User user;
  @override
  final List<Booking>? bookingList;

  @override
  String toString() {
    return 'AuthorizationState.authorized(user: $user, bookingList: $bookingList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Authenticated &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.bookingList, bookingList) ||
                const DeepCollectionEquality()
                    .equals(other.bookingList, bookingList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(bookingList);

  @JsonKey(ignore: true)
  @override
  $AuthenticatedCopyWith<Authenticated> get copyWith =>
      _$AuthenticatedCopyWithImpl<Authenticated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(User user, List<Booking>? bookingList) authorized,
    required TResult Function() unauthorized,
    required TResult Function(String? message) error,
  }) {
    return authorized(user, bookingList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(User user, List<Booking>? bookingList)? authorized,
    TResult Function()? unauthorized,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (authorized != null) {
      return authorized(user, bookingList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitialState value) initial,
    required TResult Function(AuthLoadingState value) loading,
    required TResult Function(Authenticated value) authorized,
    required TResult Function(Unauthenticated value) unauthorized,
    required TResult Function(AuthErrorState value) error,
  }) {
    return authorized(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitialState value)? initial,
    TResult Function(AuthLoadingState value)? loading,
    TResult Function(Authenticated value)? authorized,
    TResult Function(Unauthenticated value)? unauthorized,
    TResult Function(AuthErrorState value)? error,
    required TResult orElse(),
  }) {
    if (authorized != null) {
      return authorized(this);
    }
    return orElse();
  }
}

abstract class Authenticated implements AuthorizationState {
  const factory Authenticated(User user, {List<Booking>? bookingList}) =
      _$Authenticated;

  User get user => throw _privateConstructorUsedError;
  List<Booking>? get bookingList => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthenticatedCopyWith<Authenticated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnauthenticatedCopyWith<$Res> {
  factory $UnauthenticatedCopyWith(
          Unauthenticated value, $Res Function(Unauthenticated) then) =
      _$UnauthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnauthenticatedCopyWithImpl<$Res>
    extends _$AuthorizationStateCopyWithImpl<$Res>
    implements $UnauthenticatedCopyWith<$Res> {
  _$UnauthenticatedCopyWithImpl(
      Unauthenticated _value, $Res Function(Unauthenticated) _then)
      : super(_value, (v) => _then(v as Unauthenticated));

  @override
  Unauthenticated get _value => super._value as Unauthenticated;
}

/// @nodoc

class _$Unauthenticated implements Unauthenticated {
  const _$Unauthenticated();

  @override
  String toString() {
    return 'AuthorizationState.unauthorized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Unauthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(User user, List<Booking>? bookingList) authorized,
    required TResult Function() unauthorized,
    required TResult Function(String? message) error,
  }) {
    return unauthorized();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(User user, List<Booking>? bookingList)? authorized,
    TResult Function()? unauthorized,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitialState value) initial,
    required TResult Function(AuthLoadingState value) loading,
    required TResult Function(Authenticated value) authorized,
    required TResult Function(Unauthenticated value) unauthorized,
    required TResult Function(AuthErrorState value) error,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitialState value)? initial,
    TResult Function(AuthLoadingState value)? loading,
    TResult Function(Authenticated value)? authorized,
    TResult Function(Unauthenticated value)? unauthorized,
    TResult Function(AuthErrorState value)? error,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class Unauthenticated implements AuthorizationState {
  const factory Unauthenticated() = _$Unauthenticated;
}

/// @nodoc
abstract class $AuthErrorStateCopyWith<$Res> {
  factory $AuthErrorStateCopyWith(
          AuthErrorState value, $Res Function(AuthErrorState) then) =
      _$AuthErrorStateCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class _$AuthErrorStateCopyWithImpl<$Res>
    extends _$AuthorizationStateCopyWithImpl<$Res>
    implements $AuthErrorStateCopyWith<$Res> {
  _$AuthErrorStateCopyWithImpl(
      AuthErrorState _value, $Res Function(AuthErrorState) _then)
      : super(_value, (v) => _then(v as AuthErrorState));

  @override
  AuthErrorState get _value => super._value as AuthErrorState;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(AuthErrorState(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AuthErrorState implements AuthErrorState {
  const _$AuthErrorState([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'AuthorizationState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthErrorState &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  $AuthErrorStateCopyWith<AuthErrorState> get copyWith =>
      _$AuthErrorStateCopyWithImpl<AuthErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(User user, List<Booking>? bookingList) authorized,
    required TResult Function() unauthorized,
    required TResult Function(String? message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(User user, List<Booking>? bookingList)? authorized,
    TResult Function()? unauthorized,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitialState value) initial,
    required TResult Function(AuthLoadingState value) loading,
    required TResult Function(Authenticated value) authorized,
    required TResult Function(Unauthenticated value) unauthorized,
    required TResult Function(AuthErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitialState value)? initial,
    TResult Function(AuthLoadingState value)? loading,
    TResult Function(Authenticated value)? authorized,
    TResult Function(Unauthenticated value)? unauthorized,
    TResult Function(AuthErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AuthErrorState implements AuthorizationState {
  const factory AuthErrorState([String? message]) = _$AuthErrorState;

  String? get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthErrorStateCopyWith<AuthErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}
