part of 'search_bloc.dart';

@immutable
abstract class SearchState {
  const SearchState();
}

class SearchEmpty extends SearchState {}

class SearchResultState extends SearchState {
  final List<Restaurant> restaurants;
  const SearchResultState(this.restaurants);
}
