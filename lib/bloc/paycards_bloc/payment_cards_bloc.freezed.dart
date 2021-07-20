// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'payment_cards_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PaymentCardsStateTearOff {
  const _$PaymentCardsStateTearOff();

  InitialState initial() {
    return const InitialState();
  }

  LoadedData showData(List<PaymentCard> cardList) {
    return LoadedData(
      cardList,
    );
  }

  LoadingState loading() {
    return const LoadingState();
  }

  ErrorState error([String? message]) {
    return ErrorState(
      message,
    );
  }
}

/// @nodoc
const $PaymentCardsState = _$PaymentCardsStateTearOff();

/// @nodoc
mixin _$PaymentCardsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<PaymentCard> cardList) showData,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<PaymentCard> cardList)? showData,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initial,
    required TResult Function(LoadedData value) showData,
    required TResult Function(LoadingState value) loading,
    required TResult Function(ErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initial,
    TResult Function(LoadedData value)? showData,
    TResult Function(LoadingState value)? loading,
    TResult Function(ErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentCardsStateCopyWith<$Res> {
  factory $PaymentCardsStateCopyWith(
          PaymentCardsState value, $Res Function(PaymentCardsState) then) =
      _$PaymentCardsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$PaymentCardsStateCopyWithImpl<$Res>
    implements $PaymentCardsStateCopyWith<$Res> {
  _$PaymentCardsStateCopyWithImpl(this._value, this._then);

  final PaymentCardsState _value;
  // ignore: unused_field
  final $Res Function(PaymentCardsState) _then;
}

/// @nodoc
abstract class $InitialStateCopyWith<$Res> {
  factory $InitialStateCopyWith(
          InitialState value, $Res Function(InitialState) then) =
      _$InitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialStateCopyWithImpl<$Res>
    extends _$PaymentCardsStateCopyWithImpl<$Res>
    implements $InitialStateCopyWith<$Res> {
  _$InitialStateCopyWithImpl(
      InitialState _value, $Res Function(InitialState) _then)
      : super(_value, (v) => _then(v as InitialState));

  @override
  InitialState get _value => super._value as InitialState;
}

/// @nodoc

class _$InitialState implements InitialState {
  const _$InitialState();

  @override
  String toString() {
    return 'PaymentCardsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<PaymentCard> cardList) showData,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<PaymentCard> cardList)? showData,
    TResult Function()? loading,
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
    required TResult Function(InitialState value) initial,
    required TResult Function(LoadedData value) showData,
    required TResult Function(LoadingState value) loading,
    required TResult Function(ErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initial,
    TResult Function(LoadedData value)? showData,
    TResult Function(LoadingState value)? loading,
    TResult Function(ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialState implements PaymentCardsState {
  const factory InitialState() = _$InitialState;
}

/// @nodoc
abstract class $LoadedDataCopyWith<$Res> {
  factory $LoadedDataCopyWith(
          LoadedData value, $Res Function(LoadedData) then) =
      _$LoadedDataCopyWithImpl<$Res>;
  $Res call({List<PaymentCard> cardList});
}

/// @nodoc
class _$LoadedDataCopyWithImpl<$Res>
    extends _$PaymentCardsStateCopyWithImpl<$Res>
    implements $LoadedDataCopyWith<$Res> {
  _$LoadedDataCopyWithImpl(LoadedData _value, $Res Function(LoadedData) _then)
      : super(_value, (v) => _then(v as LoadedData));

  @override
  LoadedData get _value => super._value as LoadedData;

  @override
  $Res call({
    Object? cardList = freezed,
  }) {
    return _then(LoadedData(
      cardList == freezed
          ? _value.cardList
          : cardList // ignore: cast_nullable_to_non_nullable
              as List<PaymentCard>,
    ));
  }
}

/// @nodoc

class _$LoadedData implements LoadedData {
  const _$LoadedData(this.cardList);

  @override
  final List<PaymentCard> cardList;

  @override
  String toString() {
    return 'PaymentCardsState.showData(cardList: $cardList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoadedData &&
            (identical(other.cardList, cardList) ||
                const DeepCollectionEquality()
                    .equals(other.cardList, cardList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(cardList);

  @JsonKey(ignore: true)
  @override
  $LoadedDataCopyWith<LoadedData> get copyWith =>
      _$LoadedDataCopyWithImpl<LoadedData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<PaymentCard> cardList) showData,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return showData(cardList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<PaymentCard> cardList)? showData,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (showData != null) {
      return showData(cardList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initial,
    required TResult Function(LoadedData value) showData,
    required TResult Function(LoadingState value) loading,
    required TResult Function(ErrorState value) error,
  }) {
    return showData(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initial,
    TResult Function(LoadedData value)? showData,
    TResult Function(LoadingState value)? loading,
    TResult Function(ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (showData != null) {
      return showData(this);
    }
    return orElse();
  }
}

abstract class LoadedData implements PaymentCardsState {
  const factory LoadedData(List<PaymentCard> cardList) = _$LoadedData;

  List<PaymentCard> get cardList => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoadedDataCopyWith<LoadedData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadingStateCopyWith<$Res> {
  factory $LoadingStateCopyWith(
          LoadingState value, $Res Function(LoadingState) then) =
      _$LoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingStateCopyWithImpl<$Res>
    extends _$PaymentCardsStateCopyWithImpl<$Res>
    implements $LoadingStateCopyWith<$Res> {
  _$LoadingStateCopyWithImpl(
      LoadingState _value, $Res Function(LoadingState) _then)
      : super(_value, (v) => _then(v as LoadingState));

  @override
  LoadingState get _value => super._value as LoadingState;
}

/// @nodoc

class _$LoadingState implements LoadingState {
  const _$LoadingState();

  @override
  String toString() {
    return 'PaymentCardsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<PaymentCard> cardList) showData,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<PaymentCard> cardList)? showData,
    TResult Function()? loading,
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
    required TResult Function(InitialState value) initial,
    required TResult Function(LoadedData value) showData,
    required TResult Function(LoadingState value) loading,
    required TResult Function(ErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initial,
    TResult Function(LoadedData value)? showData,
    TResult Function(LoadingState value)? loading,
    TResult Function(ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingState implements PaymentCardsState {
  const factory LoadingState() = _$LoadingState;
}

/// @nodoc
abstract class $ErrorStateCopyWith<$Res> {
  factory $ErrorStateCopyWith(
          ErrorState value, $Res Function(ErrorState) then) =
      _$ErrorStateCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class _$ErrorStateCopyWithImpl<$Res>
    extends _$PaymentCardsStateCopyWithImpl<$Res>
    implements $ErrorStateCopyWith<$Res> {
  _$ErrorStateCopyWithImpl(ErrorState _value, $Res Function(ErrorState) _then)
      : super(_value, (v) => _then(v as ErrorState));

  @override
  ErrorState get _value => super._value as ErrorState;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(ErrorState(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ErrorState implements ErrorState {
  const _$ErrorState([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'PaymentCardsState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ErrorState &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  $ErrorStateCopyWith<ErrorState> get copyWith =>
      _$ErrorStateCopyWithImpl<ErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<PaymentCard> cardList) showData,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<PaymentCard> cardList)? showData,
    TResult Function()? loading,
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
    required TResult Function(InitialState value) initial,
    required TResult Function(LoadedData value) showData,
    required TResult Function(LoadingState value) loading,
    required TResult Function(ErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initial,
    TResult Function(LoadedData value)? showData,
    TResult Function(LoadingState value)? loading,
    TResult Function(ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorState implements PaymentCardsState {
  const factory ErrorState([String? message]) = _$ErrorState;

  String? get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorStateCopyWith<ErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}
