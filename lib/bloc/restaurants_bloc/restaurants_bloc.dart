import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:btime/models/restaurants_model/restaurants_model.dart';
import 'package:btime/data/repositories/restaraunts_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurants_event.dart';
part 'restaurants_state.dart';
part 'restaurants_bloc.freezed.dart';

class RestaurantsBloc extends Bloc<RestaurantsEvent, RestaurantsState> {
  RestaurantsBloc(this.repo) : super(RestaurantsState.empty());

  final RestaurantsRepository repo;

  @override
  Stream<RestaurantsState> mapEventToState(
    RestaurantsEvent event,
  ) async* {
    if (event is LoadRestaurants) {
      yield RestaurantsState.loading();
      try {
        // Map<String, dynamic> query = {'paginate': '1'};
        final restaurants = await repo.getOrganizationsList(1, event.id);
        if (restaurants == null || restaurants.isEmpty) {
          yield RestaurantsState.empty();
        } else
          yield RestaurantsState.show(restaurants);
      } catch (err) {
        yield RestaurantsState.error(err.toString());
      }
    }
  }
}
