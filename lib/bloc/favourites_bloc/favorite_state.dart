part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();
}

class FavoriteInitial extends FavoriteState {
  final Set<Restaurant> favorite;
  const FavoriteInitial(this.favorite);
  @override
  List<Object> get props => [favorite];
}
