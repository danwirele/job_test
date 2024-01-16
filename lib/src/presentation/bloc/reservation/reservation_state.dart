// ignore_for_file: must_be_immutable

part of 'reservation_bloc.dart';

sealed class ReservationState extends Equatable {
  const ReservationState();

  @override
  List<Object> get props => [];
}

final class InitialReservationState extends ReservationState {}

final class MainReservationState extends ReservationState {
  final ReservationModel reservationModel;

  final int touristCount;
  GlobalKey<FormState> headerKey;
  final TextEditingController phoneNumberTextEditingController;
  final TextEditingController emailTextEditingController;

  final bool isTextFieldsFilled;
  final List<TouristCardInfo> touristCardInfo;

  final bool repaintAll;

  MainReservationState({
    this.isTextFieldsFilled = false,
    this.repaintAll = false,
    required this.headerKey,
    required this.reservationModel,
    required this.phoneNumberTextEditingController,
    required this.emailTextEditingController,
    required this.touristCount,
    required this.touristCardInfo,
  });

  @override
  List<Object> get props => [touristCount, repaintAll, headerKey];
}

class TouristCardInfo {
  GlobalKey<FormState> stateKey;
  final TextEditingController nameTextEditingController;
  final TextEditingController surnameTextEditingController;
  final TextEditingController dateOfBirthTextEditingController;
  final TextEditingController citizenshipTextEditingController;
  final TextEditingController abroadPasportNumberTextEditingController;
  final TextEditingController abroadPasportValidityTextEditingController;

  TouristCardInfo({
    required this.stateKey,
    required this.nameTextEditingController,
    required this.surnameTextEditingController,
    required this.dateOfBirthTextEditingController,
    required this.citizenshipTextEditingController,
    required this.abroadPasportNumberTextEditingController,
    required this.abroadPasportValidityTextEditingController,
  });
}
