part of 'navigation_bloc.dart';

@immutable
abstract class IndexEvents extends Equatable {
  const IndexEvents();
  @override
  List<Object?> get props => [];
}

class UpdateIndex extends IndexEvents {
  const UpdateIndex(this.index);

  final int index;

  @override
  // TODO: implement props
  List<Object?> get props => [index];
}
