import 'package:equatable/equatable.dart';

/// Base state for all BLoC and Cubit states ensuring immutable value equality.
abstract class BaseBlocState extends Equatable {
  const BaseBlocState();

  @override
  List<Object?> get props => [];
}
