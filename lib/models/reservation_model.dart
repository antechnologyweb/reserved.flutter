import 'package:freezed_annotation/freezed_annotation.dart';
import 'restaurants_model/restaurants_model.dart';

part 'reservation_model.freezed.dart';
part 'reservation_model.g.dart';

@freezed
class SectorTable with _$SectorTable {
  factory SectorTable({
    required int id,
    required int limit,
    required String status,
  }) = _SectorTable;

  factory SectorTable.fromJson(Map<String, dynamic> json) =>
      _$SectorTableFromJson(json);
}

@freezed
class OrganizationSector with _$OrganizationSector {
  factory OrganizationSector({
    required int id,
    required int limit,
    required String status,
    required String name,
    required List<SectorTable> organization_tables,
  }) = _OrganizationSector;

  factory OrganizationSector.fromJson(Map<String, dynamic> json) =>
      _$OrganizationSectorFromJson(json);
}

class Booking{
  final id;
  final organizationId;
  final tableId;
  final String time;
  final price;
  final String date;
  final String status;

  Booking({this.id,
    required this.organizationId,
    required this.tableId,
    required this.time,
    required this.price,
    required this.date,
    required this.status
  });

  factory Booking.fromJson(Map<String, dynamic> json){
    return Booking(id: json['id'],
        organizationId: json['organization_id'],
        tableId: json['organization_table_list_id'],
        time: json['time'],
        price: json['price'],
        date: json['date'],
        status: json['status']);
  }
}
