part of 'reservation_bloc.dart';

abstract class ReservationEvent extends Equatable {
  @override
  List<Object?> get props => [];

  const ReservationEvent();
}

class LoadBookings extends ReservationEvent {}

class AddReservation extends ReservationEvent {
  final Map<String, dynamic> form;
  const AddReservation(this.form);
  @override
  List<Object?> get props => [form];
}

class RemoveReservation extends ReservationEvent {}

