import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User(this.id, this.token, this.name, this.avatar, this.phone);

  final int id;
  final String token;
  final String name;
  final String? avatar;
  // final String? cityID;
  final String phone;

  @override
  List<Object> get props => [id, token, name, phone];

  static const empty = User(
    0,
    '-',
    '-',
    '-',
    '-',
  );
}
