import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:btime/models/reservation_model.dart';
import 'package:btime/data/repositories/reservation_repository.dart';
import 'package:equatable/equatable.dart';

part 'reservation_event.dart';
part 'reservation_state.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  ReservationBloc(this.repository) : super(ReservationInitial());
  final ReservationRepository repository;

  @override
  Stream<ReservationState> mapEventToState(
    ReservationEvent event,
  ) async* {
    if (event is AddReservation) {
      yield ReservationLoading();

      var data = await repository.makeReservation(event.form);
      if (data == null) {
        yield ReservationError();
        await Future.delayed(Duration(seconds: 2));
        yield ReservationInitial();
      } else {
        yield ReservationSuccess(data.toString());
        // Future.delayed(Duration(seconds: 2)).whenComplete(() => add(GetTables(organizationId: event.form['organization_id'])));
      }
    }
  }
}
