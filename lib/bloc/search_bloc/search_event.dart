part of 'search_bloc.dart';

abstract class SearchEvent {
  const SearchEvent();
}

class SearchActive extends SearchEvent {
  final String query;

  const SearchActive(this.query);
}

class SearchActiveInCategory extends SearchEvent {
  final String query;
  final String id;

  const SearchActiveInCategory(this.query, this.id);
}
