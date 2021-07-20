// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurants_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Restaurant _$_$_RestaurantFromJson(Map<String, dynamic> json) {
  return _$_Restaurant(
    id: json['id'] as int,
    image: json['image'] as String?,
    title: json['title'] as String,
    rating: (json['rating'] ?? 0) as int?,
    description: json['description'] as String?,
    address: json['address'] as String?,
    price: int.tryParse((json['price'] ?? 0).toString()),
    monday: WeekDay.fromJson(json['monday'] as Map<String, dynamic>),
    tuesday: WeekDay.fromJson(json['tuesday'] as Map<String, dynamic>),
    wednesday: WeekDay.fromJson(json['wednesday'] as Map<String, dynamic>),
    thursday: WeekDay.fromJson(json['thursday'] as Map<String, dynamic>),
    friday: WeekDay.fromJson(json['friday'] as Map<String, dynamic>),
    saturday: WeekDay.fromJson(json['saturday'] as Map<String, dynamic>),
    sunday: WeekDay.fromJson(json['sunday'] as Map<String, dynamic>),
    shop_category_id: (json['shop_category_id'] ?? 0) as int,
  );
}

Map<String, dynamic> _$_$_RestaurantToJson(_$_Restaurant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'title': instance.title,
      'rating': instance.rating,
      'description': instance.description,
      'address': instance.address,
      'price': instance.price,
      'monday': instance.monday,
      'tuesday': instance.tuesday,
      'wednesday': instance.wednesday,
      'thursday': instance.thursday,
      'friday': instance.friday,
      'saturday': instance.saturday,
      'sunday': instance.sunday,
      'shop_category_id': instance.shop_category_id,
    };

_$_WeekDay _$_$_WeekDayFromJson(Map<String, dynamic> json) {
  return _$_WeekDay(
    start: json['start'] as String,
    end: json['end'] as String,
  );
}

Map<String, dynamic> _$_$_WeekDayToJson(_$_WeekDay instance) =>
    <String, dynamic>{
      'start': instance.start,
      'end': instance.end,
    };
