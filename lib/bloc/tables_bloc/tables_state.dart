part of 'tables_bloc.dart';

@immutable
abstract class TablesState extends Equatable{
  const TablesState();
}

class TablesLoading extends TablesState {

  @override
  List<Object?> get props => [];
}

class TablesLoaded extends TablesState {
  final List<OrganizationSector> data;
  final List<Booking> bookings;
  const TablesLoaded(this.data, this.bookings);

  @override
  List<Object> get props => [data];
}
