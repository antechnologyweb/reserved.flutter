part of 'restaurants_bloc.dart';

@immutable
abstract class RestaurantsEvent extends Equatable {
  const RestaurantsEvent();
  @override
  List<Object?> get props => [];
}

class LoadRestaurants extends RestaurantsEvent {
  final String id;

  const LoadRestaurants(this.id);

  @override
  List<Object?> get props => [id];
}
