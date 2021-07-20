import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:btime/models/restaurants_model/restaurants_model.dart';
import 'package:btime/data/repositories/favors_repository.dart';
import 'package:equatable/equatable.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc(this.repository) : super(FavoriteInitial(Set()));
  final FavoritesRepository repository;

  @override
  Stream<FavoriteState> mapEventToState(
    FavoriteEvent event,
  ) async* {
    print(event.runtimeType);
    if (event is LoadFavorites) {
      var data = await repository.loadFromCache();
      yield FavoriteInitial(Set.from(data));
    } else if (event is AddFavorite) {
      var data = await repository.addFav(event.object);
      yield FavoriteInitial(Set.from(data));
    } else if (event is RemoveFavorite) {
      var data = await repository.removeFav(event.object);
      yield FavoriteInitial(Set.from(data));
    }
  }
}
