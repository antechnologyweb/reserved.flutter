import 'package:freezed_annotation/freezed_annotation.dart';
part 'restaurants_model.freezed.dart';

part 'restaurants_model.g.dart';

@freezed
class Restaurant with _$Restaurant {
  factory Restaurant({
    required int id,
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
    required int shop_category_id,
    // required bool favorite,
  }) = _Restaurant;

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);
}

@freezed
class WeekDay with _$WeekDay {
  factory WeekDay({required String start, required String end}) = _WeekDay;
  factory WeekDay.fromJson(Map<String, dynamic> json) =>
      _$WeekDayFromJson(json);
}
