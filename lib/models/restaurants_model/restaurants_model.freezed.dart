// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'restaurants_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) {
  return _Restaurant.fromJson(json);
}

/// @nodoc
class _$RestaurantTearOff {
  const _$RestaurantTearOff();

  _Restaurant call(
      {required int id,
      String? image,
      required String title,
      int? rating,
      String? description,
      String? address,
      int? price,
      required WeekDay monday,
      required WeekDay tuesday,
      required WeekDay wednesday,
      required WeekDay thursday,
      required WeekDay friday,
      required WeekDay saturday,
      required WeekDay sunday,
      required int shop_category_id}) {
    return _Restaurant(
      id: id,
      image: image,
      title: title,
      rating: rating,
      description: description,
      address: address,
      price: price,
      monday: monday,
      tuesday: tuesday,
      wednesday: wednesday,
      thursday: thursday,
      friday: friday,
      saturday: saturday,
      sunday: sunday,
      shop_category_id: shop_category_id,
    );
  }

  Restaurant fromJson(Map<String, Object> json) {
    return Restaurant.fromJson(json);
  }
}

/// @nodoc
const $Restaurant = _$RestaurantTearOff();

/// @nodoc
mixin _$Restaurant {
  int get id => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int? get rating => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  WeekDay get monday => throw _privateConstructorUsedError;
  WeekDay get tuesday => throw _privateConstructorUsedError;
  WeekDay get wednesday => throw _privateConstructorUsedError;
  WeekDay get thursday => throw _privateConstructorUsedError;
  WeekDay get friday => throw _privateConstructorUsedError;
  WeekDay get saturday => throw _privateConstructorUsedError;
  WeekDay get sunday => throw _privateConstructorUsedError;
  int get shop_category_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestaurantCopyWith<Restaurant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantCopyWith<$Res> {
  factory $RestaurantCopyWith(
          Restaurant value, $Res Function(Restaurant) then) =
      _$RestaurantCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String? image,
      String title,
      int? rating,
      String? description,
      String? address,
      int? price,
      WeekDay monday,
      WeekDay tuesday,
      WeekDay wednesday,
      WeekDay thursday,
      WeekDay friday,
      WeekDay saturday,
      WeekDay sunday,
      int shop_category_id});

  $WeekDayCopyWith<$Res> get monday;
  $WeekDayCopyWith<$Res> get tuesday;
  $WeekDayCopyWith<$Res> get wednesday;
  $WeekDayCopyWith<$Res> get thursday;
  $WeekDayCopyWith<$Res> get friday;
  $WeekDayCopyWith<$Res> get saturday;
  $WeekDayCopyWith<$Res> get sunday;
}

/// @nodoc
class _$RestaurantCopyWithImpl<$Res> implements $RestaurantCopyWith<$Res> {
  _$RestaurantCopyWithImpl(this._value, this._then);

  final Restaurant _value;
  // ignore: unused_field
  final $Res Function(Restaurant) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? title = freezed,
    Object? rating = freezed,
    Object? description = freezed,
    Object? address = freezed,
    Object? price = freezed,
    Object? monday = freezed,
    Object? tuesday = freezed,
    Object? wednesday = freezed,
    Object? thursday = freezed,
    Object? friday = freezed,
    Object? saturday = freezed,
    Object? sunday = freezed,
    Object? shop_category_id = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      monday: monday == freezed
          ? _value.monday
          : monday // ignore: cast_nullable_to_non_nullable
              as WeekDay,
      tuesday: tuesday == freezed
          ? _value.tuesday
          : tuesday // ignore: cast_nullable_to_non_nullable
              as WeekDay,
      wednesday: wednesday == freezed
          ? _value.wednesday
          : wednesday // ignore: cast_nullable_to_non_nullable
              as WeekDay,
      thursday: thursday == freezed
          ? _value.thursday
          : thursday // ignore: cast_nullable_to_non_nullable
              as WeekDay,
      friday: friday == freezed
          ? _value.friday
          : friday // ignore: cast_nullable_to_non_nullable
              as WeekDay,
      saturday: saturday == freezed
          ? _value.saturday
          : saturday // ignore: cast_nullable_to_non_nullable
              as WeekDay,
      sunday: sunday == freezed
          ? _value.sunday
          : sunday // ignore: cast_nullable_to_non_nullable
              as WeekDay,
      shop_category_id: shop_category_id == freezed
          ? _value.shop_category_id
          : shop_category_id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  $WeekDayCopyWith<$Res> get monday {
    return $WeekDayCopyWith<$Res>(_value.monday, (value) {
      return _then(_value.copyWith(monday: value));
    });
  }

  @override
  $WeekDayCopyWith<$Res> get tuesday {
    return $WeekDayCopyWith<$Res>(_value.tuesday, (value) {
      return _then(_value.copyWith(tuesday: value));
    });
  }

  @override
  $WeekDayCopyWith<$Res> get wednesday {
    return $WeekDayCopyWith<$Res>(_value.wednesday, (value) {
      return _then(_value.copyWith(wednesday: value));
    });
  }

  @override
  $WeekDayCopyWith<$Res> get thursday {
    return $WeekDayCopyWith<$Res>(_value.thursday, (value) {
      return _then(_value.copyWith(thursday: value));
    });
  }

  @override
  $WeekDayCopyWith<$Res> get friday {
    return $WeekDayCopyWith<$Res>(_value.friday, (value) {
      return _then(_value.copyWith(friday: value));
    });
  }

  @override
  $WeekDayCopyWith<$Res> get saturday {
    return $WeekDayCopyWith<$Res>(_value.saturday, (value) {
      return _then(_value.copyWith(saturday: value));
    });
  }

  @override
  $WeekDayCopyWith<$Res> get sunday {
    return $WeekDayCopyWith<$Res>(_value.sunday, (value) {
      return _then(_value.copyWith(sunday: value));
    });
  }
}

/// @nodoc
abstract class _$RestaurantCopyWith<$Res> implements $RestaurantCopyWith<$Res> {
  factory _$RestaurantCopyWith(
          _Restaurant value, $Res Function(_Restaurant) then) =
      __$RestaurantCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String? image,
      String title,
      int? rating,
      String? description,
      String? address,
      int? price,
      WeekDay monday,
      WeekDay tuesday,
      WeekDay wednesday,
      WeekDay thursday,
      WeekDay friday,
      WeekDay saturday,
      WeekDay sunday,
      int shop_category_id});

  @override
  $WeekDayCopyWith<$Res> get monday;
  @override
  $WeekDayCopyWith<$Res> get tuesday;
  @override
  $WeekDayCopyWith<$Res> get wednesday;
  @override
  $WeekDayCopyWith<$Res> get thursday;
  @override
  $WeekDayCopyWith<$Res> get friday;
  @override
  $WeekDayCopyWith<$Res> get saturday;
  @override
  $WeekDayCopyWith<$Res> get sunday;
}

/// @nodoc
class __$RestaurantCopyWithImpl<$Res> extends _$RestaurantCopyWithImpl<$Res>
    implements _$RestaurantCopyWith<$Res> {
  __$RestaurantCopyWithImpl(
      _Restaurant _value, $Res Function(_Restaurant) _then)
      : super(_value, (v) => _then(v as _Restaurant));

  @override
  _Restaurant get _value => super._value as _Restaurant;

  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? title = freezed,
    Object? rating = freezed,
    Object? description = freezed,
    Object? address = freezed,
    Object? price = freezed,
    Object? monday = freezed,
    Object? tuesday = freezed,
    Object? wednesday = freezed,
    Object? thursday = freezed,
    Object? friday = freezed,
    Object? saturday = freezed,
    Object? sunday = freezed,
    Object? shop_category_id = freezed,
  }) {
    return _then(_Restaurant(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      monday: monday == freezed
          ? _value.monday
          : monday // ignore: cast_nullable_to_non_nullable
              as WeekDay,
      tuesday: tuesday == freezed
          ? _value.tuesday
          : tuesday // ignore: cast_nullable_to_non_nullable
              as WeekDay,
      wednesday: wednesday == freezed
          ? _value.wednesday
          : wednesday // ignore: cast_nullable_to_non_nullable
              as WeekDay,
      thursday: thursday == freezed
          ? _value.thursday
          : thursday // ignore: cast_nullable_to_non_nullable
              as WeekDay,
      friday: friday == freezed
          ? _value.friday
          : friday // ignore: cast_nullable_to_non_nullable
              as WeekDay,
      saturday: saturday == freezed
          ? _value.saturday
          : saturday // ignore: cast_nullable_to_non_nullable
              as WeekDay,
      sunday: sunday == freezed
          ? _value.sunday
          : sunday // ignore: cast_nullable_to_non_nullable
              as WeekDay,
      shop_category_id: shop_category_id == freezed
          ? _value.shop_category_id
          : shop_category_id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Restaurant implements _Restaurant {
  _$_Restaurant(
      {required this.id,
      this.image,
      required this.title,
      this.rating,
      this.description,
      this.address,
      this.price,
      required this.monday,
      required this.tuesday,
      required this.wednesday,
      required this.thursday,
      required this.friday,
      required this.saturday,
      required this.sunday,
      required this.shop_category_id});

  factory _$_Restaurant.fromJson(Map<String, dynamic> json) =>
      _$_$_RestaurantFromJson(json);

  @override
  final int id;
  @override
  final String? image;
  @override
  final String title;
  @override
  final int? rating;
  @override
  final String? description;
  @override
  final String? address;
  @override
  final int? price;
  @override
  final WeekDay monday;
  @override
  final WeekDay tuesday;
  @override
  final WeekDay wednesday;
  @override
  final WeekDay thursday;
  @override
  final WeekDay friday;
  @override
  final WeekDay saturday;
  @override
  final WeekDay sunday;
  @override
  final int shop_category_id;

  @override
  String toString() {
    return 'Restaurant(id: $id, image: $image, title: $title, rating: $rating, description: $description, address: $address, price: $price, monday: $monday, tuesday: $tuesday, wednesday: $wednesday, thursday: $thursday, friday: $friday, saturday: $saturday, sunday: $sunday, shop_category_id: $shop_category_id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Restaurant &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.rating, rating) ||
                const DeepCollectionEquality().equals(other.rating, rating)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.monday, monday) ||
                const DeepCollectionEquality().equals(other.monday, monday)) &&
            (identical(other.tuesday, tuesday) ||
                const DeepCollectionEquality()
                    .equals(other.tuesday, tuesday)) &&
            (identical(other.wednesday, wednesday) ||
                const DeepCollectionEquality()
                    .equals(other.wednesday, wednesday)) &&
            (identical(other.thursday, thursday) ||
                const DeepCollectionEquality()
                    .equals(other.thursday, thursday)) &&
            (identical(other.friday, friday) ||
                const DeepCollectionEquality().equals(other.friday, friday)) &&
            (identical(other.saturday, saturday) ||
                const DeepCollectionEquality()
                    .equals(other.saturday, saturday)) &&
            (identical(other.sunday, sunday) ||
                const DeepCollectionEquality().equals(other.sunday, sunday)) &&
            (identical(other.shop_category_id, shop_category_id) ||
                const DeepCollectionEquality()
                    .equals(other.shop_category_id, shop_category_id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(rating) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(monday) ^
      const DeepCollectionEquality().hash(tuesday) ^
      const DeepCollectionEquality().hash(wednesday) ^
      const DeepCollectionEquality().hash(thursday) ^
      const DeepCollectionEquality().hash(friday) ^
      const DeepCollectionEquality().hash(saturday) ^
      const DeepCollectionEquality().hash(sunday) ^
      const DeepCollectionEquality().hash(shop_category_id);

  @JsonKey(ignore: true)
  @override
  _$RestaurantCopyWith<_Restaurant> get copyWith =>
      __$RestaurantCopyWithImpl<_Restaurant>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RestaurantToJson(this);
  }
}

abstract class _Restaurant implements Restaurant {
  factory _Restaurant(
      {required int id,
      String? image,
      required String title,
      int? rating,
      String? description,
      String? address,
      int? price,
      required WeekDay monday,
      required WeekDay tuesday,
      required WeekDay wednesday,
      required WeekDay thursday,
      required WeekDay friday,
      required WeekDay saturday,
      required WeekDay sunday,
      required int shop_category_id}) = _$_Restaurant;

  factory _Restaurant.fromJson(Map<String, dynamic> json) =
      _$_Restaurant.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String? get image => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  int? get rating => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  String? get address => throw _privateConstructorUsedError;
  @override
  int? get price => throw _privateConstructorUsedError;
  @override
  WeekDay get monday => throw _privateConstructorUsedError;
  @override
  WeekDay get tuesday => throw _privateConstructorUsedError;
  @override
  WeekDay get wednesday => throw _privateConstructorUsedError;
  @override
  WeekDay get thursday => throw _privateConstructorUsedError;
  @override
  WeekDay get friday => throw _privateConstructorUsedError;
  @override
  WeekDay get saturday => throw _privateConstructorUsedError;
  @override
  WeekDay get sunday => throw _privateConstructorUsedError;
  @override
  int get shop_category_id => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RestaurantCopyWith<_Restaurant> get copyWith =>
      throw _privateConstructorUsedError;
}

WeekDay _$WeekDayFromJson(Map<String, dynamic> json) {
  return _WeekDay.fromJson(json);
}

/// @nodoc
class _$WeekDayTearOff {
  const _$WeekDayTearOff();

  _WeekDay call({required String start, required String end}) {
    return _WeekDay(
      start: start,
      end: end,
    );
  }

  WeekDay fromJson(Map<String, Object> json) {
    return WeekDay.fromJson(json);
  }
}

/// @nodoc
const $WeekDay = _$WeekDayTearOff();

/// @nodoc
mixin _$WeekDay {
  String get start => throw _privateConstructorUsedError;
  String get end => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeekDayCopyWith<WeekDay> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeekDayCopyWith<$Res> {
  factory $WeekDayCopyWith(WeekDay value, $Res Function(WeekDay) then) =
      _$WeekDayCopyWithImpl<$Res>;
  $Res call({String start, String end});
}

/// @nodoc
class _$WeekDayCopyWithImpl<$Res> implements $WeekDayCopyWith<$Res> {
  _$WeekDayCopyWithImpl(this._value, this._then);

  final WeekDay _value;
  // ignore: unused_field
  final $Res Function(WeekDay) _then;

  @override
  $Res call({
    Object? start = freezed,
    Object? end = freezed,
  }) {
    return _then(_value.copyWith(
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String,
      end: end == freezed
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$WeekDayCopyWith<$Res> implements $WeekDayCopyWith<$Res> {
  factory _$WeekDayCopyWith(_WeekDay value, $Res Function(_WeekDay) then) =
      __$WeekDayCopyWithImpl<$Res>;
  @override
  $Res call({String start, String end});
}

/// @nodoc
class __$WeekDayCopyWithImpl<$Res> extends _$WeekDayCopyWithImpl<$Res>
    implements _$WeekDayCopyWith<$Res> {
  __$WeekDayCopyWithImpl(_WeekDay _value, $Res Function(_WeekDay) _then)
      : super(_value, (v) => _then(v as _WeekDay));

  @override
  _WeekDay get _value => super._value as _WeekDay;

  @override
  $Res call({
    Object? start = freezed,
    Object? end = freezed,
  }) {
    return _then(_WeekDay(
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String,
      end: end == freezed
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WeekDay implements _WeekDay {
  _$_WeekDay({required this.start, required this.end});

  factory _$_WeekDay.fromJson(Map<String, dynamic> json) =>
      _$_$_WeekDayFromJson(json);

  @override
  final String start;
  @override
  final String end;

  @override
  String toString() {
    return 'WeekDay(start: $start, end: $end)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WeekDay &&
            (identical(other.start, start) ||
                const DeepCollectionEquality().equals(other.start, start)) &&
            (identical(other.end, end) ||
                const DeepCollectionEquality().equals(other.end, end)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(start) ^
      const DeepCollectionEquality().hash(end);

  @JsonKey(ignore: true)
  @override
  _$WeekDayCopyWith<_WeekDay> get copyWith =>
      __$WeekDayCopyWithImpl<_WeekDay>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_WeekDayToJson(this);
  }
}

abstract class _WeekDay implements WeekDay {
  factory _WeekDay({required String start, required String end}) = _$_WeekDay;

  factory _WeekDay.fromJson(Map<String, dynamic> json) = _$_WeekDay.fromJson;

  @override
  String get start => throw _privateConstructorUsedError;
  @override
  String get end => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$WeekDayCopyWith<_WeekDay> get copyWith =>
      throw _privateConstructorUsedError;
}
