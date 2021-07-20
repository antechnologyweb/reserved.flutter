// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'reservation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SectorTable _$SectorTableFromJson(Map<String, dynamic> json) {
  return _SectorTable.fromJson(json);
}

/// @nodoc
class _$SectorTableTearOff {
  const _$SectorTableTearOff();

  _SectorTable call(
      {required int id, required int limit, required String status}) {
    return _SectorTable(
      id: id,
      limit: limit,
      status: status,
    );
  }

  SectorTable fromJson(Map<String, Object> json) {
    return SectorTable.fromJson(json);
  }
}

/// @nodoc
const $SectorTable = _$SectorTableTearOff();

/// @nodoc
mixin _$SectorTable {
  int get id => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SectorTableCopyWith<SectorTable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SectorTableCopyWith<$Res> {
  factory $SectorTableCopyWith(
          SectorTable value, $Res Function(SectorTable) then) =
      _$SectorTableCopyWithImpl<$Res>;
  $Res call({int id, int limit, String status});
}

/// @nodoc
class _$SectorTableCopyWithImpl<$Res> implements $SectorTableCopyWith<$Res> {
  _$SectorTableCopyWithImpl(this._value, this._then);

  final SectorTable _value;
  // ignore: unused_field
  final $Res Function(SectorTable) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? limit = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SectorTableCopyWith<$Res>
    implements $SectorTableCopyWith<$Res> {
  factory _$SectorTableCopyWith(
          _SectorTable value, $Res Function(_SectorTable) then) =
      __$SectorTableCopyWithImpl<$Res>;
  @override
  $Res call({int id, int limit, String status});
}

/// @nodoc
class __$SectorTableCopyWithImpl<$Res> extends _$SectorTableCopyWithImpl<$Res>
    implements _$SectorTableCopyWith<$Res> {
  __$SectorTableCopyWithImpl(
      _SectorTable _value, $Res Function(_SectorTable) _then)
      : super(_value, (v) => _then(v as _SectorTable));

  @override
  _SectorTable get _value => super._value as _SectorTable;

  @override
  $Res call({
    Object? id = freezed,
    Object? limit = freezed,
    Object? status = freezed,
  }) {
    return _then(_SectorTable(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SectorTable implements _SectorTable {
  _$_SectorTable({required this.id, required this.limit, required this.status});

  factory _$_SectorTable.fromJson(Map<String, dynamic> json) =>
      _$_$_SectorTableFromJson(json);

  @override
  final int id;
  @override
  final int limit;
  @override
  final String status;

  @override
  String toString() {
    return 'SectorTable(id: $id, limit: $limit, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SectorTable &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.limit, limit) ||
                const DeepCollectionEquality().equals(other.limit, limit)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(limit) ^
      const DeepCollectionEquality().hash(status);

  @JsonKey(ignore: true)
  @override
  _$SectorTableCopyWith<_SectorTable> get copyWith =>
      __$SectorTableCopyWithImpl<_SectorTable>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SectorTableToJson(this);
  }
}

abstract class _SectorTable implements SectorTable {
  factory _SectorTable(
      {required int id,
      required int limit,
      required String status}) = _$_SectorTable;

  factory _SectorTable.fromJson(Map<String, dynamic> json) =
      _$_SectorTable.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  int get limit => throw _privateConstructorUsedError;
  @override
  String get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SectorTableCopyWith<_SectorTable> get copyWith =>
      throw _privateConstructorUsedError;
}

OrganizationSector _$OrganizationSectorFromJson(Map<String, dynamic> json) {
  return _OrganizationSector.fromJson(json);
}

/// @nodoc
class _$OrganizationSectorTearOff {
  const _$OrganizationSectorTearOff();

  _OrganizationSector call(
      {required int id,
      required int limit,
      required String status,
      required String name,
      required List<SectorTable> organization_tables}) {
    return _OrganizationSector(
      id: id,
      limit: limit,
      status: status,
      name: name,
      organization_tables: organization_tables,
    );
  }

  OrganizationSector fromJson(Map<String, Object> json) {
    return OrganizationSector.fromJson(json);
  }
}

/// @nodoc
const $OrganizationSector = _$OrganizationSectorTearOff();

/// @nodoc
mixin _$OrganizationSector {
  int get id => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<SectorTable> get organization_tables =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrganizationSectorCopyWith<OrganizationSector> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrganizationSectorCopyWith<$Res> {
  factory $OrganizationSectorCopyWith(
          OrganizationSector value, $Res Function(OrganizationSector) then) =
      _$OrganizationSectorCopyWithImpl<$Res>;
  $Res call(
      {int id,
      int limit,
      String status,
      String name,
      List<SectorTable> organization_tables});
}

/// @nodoc
class _$OrganizationSectorCopyWithImpl<$Res>
    implements $OrganizationSectorCopyWith<$Res> {
  _$OrganizationSectorCopyWithImpl(this._value, this._then);

  final OrganizationSector _value;
  // ignore: unused_field
  final $Res Function(OrganizationSector) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? limit = freezed,
    Object? status = freezed,
    Object? name = freezed,
    Object? organization_tables = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      organization_tables: organization_tables == freezed
          ? _value.organization_tables
          : organization_tables // ignore: cast_nullable_to_non_nullable
              as List<SectorTable>,
    ));
  }
}

/// @nodoc
abstract class _$OrganizationSectorCopyWith<$Res>
    implements $OrganizationSectorCopyWith<$Res> {
  factory _$OrganizationSectorCopyWith(
          _OrganizationSector value, $Res Function(_OrganizationSector) then) =
      __$OrganizationSectorCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      int limit,
      String status,
      String name,
      List<SectorTable> organization_tables});
}

/// @nodoc
class __$OrganizationSectorCopyWithImpl<$Res>
    extends _$OrganizationSectorCopyWithImpl<$Res>
    implements _$OrganizationSectorCopyWith<$Res> {
  __$OrganizationSectorCopyWithImpl(
      _OrganizationSector _value, $Res Function(_OrganizationSector) _then)
      : super(_value, (v) => _then(v as _OrganizationSector));

  @override
  _OrganizationSector get _value => super._value as _OrganizationSector;

  @override
  $Res call({
    Object? id = freezed,
    Object? limit = freezed,
    Object? status = freezed,
    Object? name = freezed,
    Object? organization_tables = freezed,
  }) {
    return _then(_OrganizationSector(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      organization_tables: organization_tables == freezed
          ? _value.organization_tables
          : organization_tables // ignore: cast_nullable_to_non_nullable
              as List<SectorTable>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrganizationSector implements _OrganizationSector {
  _$_OrganizationSector(
      {required this.id,
      required this.limit,
      required this.status,
      required this.name,
      required this.organization_tables});

  factory _$_OrganizationSector.fromJson(Map<String, dynamic> json) =>
      _$_$_OrganizationSectorFromJson(json);

  @override
  final int id;
  @override
  final int limit;
  @override
  final String status;
  @override
  final String name;
  @override
  final List<SectorTable> organization_tables;

  @override
  String toString() {
    return 'OrganizationSector(id: $id, limit: $limit, status: $status, name: $name, organization_tables: $organization_tables)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OrganizationSector &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.limit, limit) ||
                const DeepCollectionEquality().equals(other.limit, limit)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.organization_tables, organization_tables) ||
                const DeepCollectionEquality()
                    .equals(other.organization_tables, organization_tables)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(limit) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(organization_tables);

  @JsonKey(ignore: true)
  @override
  _$OrganizationSectorCopyWith<_OrganizationSector> get copyWith =>
      __$OrganizationSectorCopyWithImpl<_OrganizationSector>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_OrganizationSectorToJson(this);
  }
}

abstract class _OrganizationSector implements OrganizationSector {
  factory _OrganizationSector(
      {required int id,
      required int limit,
      required String status,
      required String name,
      required List<SectorTable> organization_tables}) = _$_OrganizationSector;

  factory _OrganizationSector.fromJson(Map<String, dynamic> json) =
      _$_OrganizationSector.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  int get limit => throw _privateConstructorUsedError;
  @override
  String get status => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  List<SectorTable> get organization_tables =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$OrganizationSectorCopyWith<_OrganizationSector> get copyWith =>
      throw _privateConstructorUsedError;
}


