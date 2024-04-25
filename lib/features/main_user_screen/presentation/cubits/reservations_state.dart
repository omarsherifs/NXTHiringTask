part of 'reservations_cubit.dart';

abstract class ReservationsState extends Equatable {
  const ReservationsState();

  @override
  List<Object> get props => [];
}

class ReservationsInitial extends ReservationsState {}

class ReservationsLoading extends ReservationsState {}

class ReservationsSuccess extends ReservationsState {}

class ReservationsError extends ReservationsState {
  const ReservationsError(this.errorMessage);
  final String errorMessage;
}
