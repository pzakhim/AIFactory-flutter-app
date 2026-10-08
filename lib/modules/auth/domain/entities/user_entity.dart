import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
    required this.id,
    required this.name,
    required this.accountNumber,
    required this.balance,
  });

  final String id;
  final String name;
  final String accountNumber;
  final String balance;

  @override
  List<Object?> get props => [id, name, accountNumber, balance];
}
