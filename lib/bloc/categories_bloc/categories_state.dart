part of 'categories_bloc.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState.initial() = InitialState;
  const factory CategoriesState.show(List<Categories> categories) = LoadedState;
  const factory CategoriesState.loading() = LoadingState;
  const factory CategoriesState.error([String? message]) = ErrorState;
}

// class CategoriesInitial extends CategoriesState {
//   @override
//   List<Object> get props => [];
// }
//
// class LoadedCategories extends CategoriesState {
//   final UnmodifiableListView<Categories> categories;
//   const LoadedCategories(this.categories);
//   @override
//   List<Object> get props => [categories];
// }
//
// class LoadingCategories extends CategoriesState {
//   @override
//   List<Object> get props => [];
// }
