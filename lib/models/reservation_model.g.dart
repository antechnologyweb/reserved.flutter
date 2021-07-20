// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SectorTable _$_$_SectorTableFromJson(Map<String, dynamic> json) {
  return _$_SectorTable(
    id: json['id'] as int,
    limit: json['limit'] as int,
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$_$_SectorTableToJson(_$_SectorTable instance) =>
    <String, dynamic>{
      'id': instance.id,
      'limit': instance.limit,
      'status': instance.status,
    };

_$_OrganizationSector _$_$_OrganizationSectorFromJson(
    Map<String, dynamic> json) {
  return _$_OrganizationSector(
    id: json['id'] as int,
    limit: json['limit'] as int,
    status: json['status'] as String,
    name: json['name'] as String,
    organization_tables: (json['organization_tables'] as List<dynamic>)
        .map((e) => SectorTable.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_OrganizationSectorToJson(
        _$_OrganizationSector instance) =>
    <String, dynamic>{
      'id': instance.id,
      'limit': instance.limit,
      'status': instance.status,
      'name': instance.name,
      'organization_tables': instance.organization_tables,
    };


