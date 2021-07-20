import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:btime/models/restaurants_model/restaurants_model.dart';
import 'package:meta/meta.dart';
import 'package:btime/http_client/http_client.dart';
import 'package:rxdart/rxdart.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchEmpty());

  final repo = SearchRepo();

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is SearchActive) {
      if (event.query.isEmpty) {
        yield SearchEmpty();
      } else {
        final restaurants = await repo.search(event.query);
        yield SearchResultState(restaurants);
      }
    }
  }

  @override
  Stream<Transition<SearchEvent, SearchState>> transformEvents(
      Stream<SearchEvent> events, transitionFn) {
    return events
        .debounceTime(const Duration(milliseconds: 150))
        .switchMap((transitionFn));
  }
}

class SearchInCatBloc extends Bloc<SearchEvent, SearchState> {
  SearchInCatBloc() : super(SearchEmpty());

  final repo = SearchRepo();

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is SearchActiveInCategory) {
      if (event.query.isEmpty) {
        yield SearchEmpty();
      } else {
        final restaurants = await repo.searchInCategory(event.id, event.query);
        yield SearchResultState(restaurants);
      }
    }
  }

  @override
  Stream<Transition<SearchEvent, SearchState>> transformEvents(
      Stream<SearchEvent> events, transitionFn) {
    return events
        .debounceTime(const Duration(milliseconds: 150))
        .switchMap((transitionFn));
  }
}

class SearchRepo {
  search(query) async {
    //http://reserved.org.kz/api/organizations/opetit
    final response =
        await HttpClientS.get(routeEndPoint: 'organizations/$query');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var restaurants = List.generate(data['data'].length,
          (index) => Restaurant.fromJson(data['data'][index]));
      return restaurants;
    } else {
      print('Restaurant from json');
    }
  }

  searchInCategory(String catId, query) async {
    final response =
        await HttpClientS.get(routeEndPoint: 'organizations/$query');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Restaurant> searchResult = [];
      for (var restaurant in data['data']) {
        if (restaurant['category_id']['id'].toString() == catId) {
          searchResult.add(Restaurant.fromJson(restaurant));
        }
      }
      // var restaurants = List.generate(data['data'].length,
      //     (index) => Restaurant.fromJson(data['data'][index]));
      return searchResult;
    } else {
      print('Restaurant from json');
    }
  }
}
