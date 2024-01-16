part of 'reservation_bloc.dart';

sealed class ReservationEvent extends Equatable {
  const ReservationEvent();

  @override
  List<Object> get props => [];
}

final class InitReservationEvent extends ReservationEvent {}

final class AddTouristReservationEvent extends ReservationEvent {}

final class CheckTextFieldsReservationEvent extends ReservationEvent {
  final BuildContext context;

  const CheckTextFieldsReservationEvent({required this.context});
}
