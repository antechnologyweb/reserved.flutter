import 'package:freezed_annotation/freezed_annotation.dart';
part 'categories_model.freezed.dart';

part 'categories_model.g.dart';

@freezed
class Categories with _$Categories {
  factory Categories({
    required int id,
    required String title,
    String? image,
  }) = _Categories;

  factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);
}
