import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:btime/models/reservation_model.dart';
import 'package:btime/data/repositories/reservation_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'tables_event.dart';
part 'tables_state.dart';

class TablesBloc extends Bloc<TablesEvent, TablesState> {
  final ReservationRepository reservationRepository;
  TablesBloc(this.reservationRepository) : super(TablesLoading());

  @override
  Stream<TablesState> mapEventToState(
    TablesEvent event,
  ) async* {
    if(event is LoadTables){
      var tables = await reservationRepository.getTables(event.organizationId);
      var reservedTables =
      await reservationRepository.loadOrganizationBookings(event.organizationId);
      if (tables != null) yield TablesLoaded(tables, reservedTables ?? []);

    }
  }
}
