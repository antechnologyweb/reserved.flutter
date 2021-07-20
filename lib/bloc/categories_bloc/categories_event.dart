part of 'categories_bloc.dart';

abstract class CategoriesEvent extends Equatable {
  const CategoriesEvent();
}

class LoadCategoriesEvent extends CategoriesEvent {
  const LoadCategoriesEvent(this.token);

  final String? token;

  @override
  List<Object?> get props => [token];
}
