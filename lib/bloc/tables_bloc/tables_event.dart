part of 'tables_bloc.dart';

@immutable
abstract class TablesEvent extends Equatable{
  const TablesEvent();
}

class LoadTables extends TablesEvent{
  final int organizationId;
  const LoadTables({required this.organizationId});
  @override
  List<Object?> get props => [organizationId];
}