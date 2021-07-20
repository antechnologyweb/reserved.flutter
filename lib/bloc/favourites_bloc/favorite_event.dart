part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();
  @override
  List<Object?> get props => [];
}

class AddFavorite extends FavoriteEvent {
  final Restaurant object;

  const AddFavorite(this.object);
  @override
  List<Object?> get props => [object];
}

class RemoveFavorite extends FavoriteEvent {
  final Restaurant object;
  @override
  List<Object?> get props => [object];

  const RemoveFavorite(this.object);
}

class LoadFavorites extends FavoriteEvent {}
