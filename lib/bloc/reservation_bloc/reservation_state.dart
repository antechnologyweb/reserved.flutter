part of 'reservation_bloc.dart';

abstract class ReservationState extends Equatable {
  const ReservationState();
  @override
  List<Object> get props => [];
}

class ReservationInitial extends ReservationState {}

class ReservationLoading extends ReservationState {}


class ReservationError extends ReservationState {
  final String? errorMsg;
  const ReservationError({this.errorMsg});//should be required later
}


class ReservationSuccess extends ReservationState {
  final String url;

  const ReservationSuccess(this.url);
}
