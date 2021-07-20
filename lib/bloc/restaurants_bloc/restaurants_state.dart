part of 'restaurants_bloc.dart';

@freezed
class RestaurantsState with _$RestaurantsState {
  const factory RestaurantsState.empty() = InitialState;
  const factory RestaurantsState.show(List<Restaurant> restaurants) =
      LoadedState;
  const factory RestaurantsState.loading() = LoadingState;
  const factory RestaurantsState.error(String errorMessage) = ErrorState;
}
