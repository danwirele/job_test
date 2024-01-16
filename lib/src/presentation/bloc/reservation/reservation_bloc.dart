// ignore_for_file: invalid_use_of_protected_member

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:job_test/core/failure/failure.dart';
import 'package:job_test/core/usecase/usecase.dart';
import 'package:job_test/src/data/model/reservation_model.dart';
import 'package:job_test/src/domain/usecases/get_reservation_info_usecase.dart';
import 'package:job_test/src/presentation/pages/paid_page.dart';

part 'reservation_event.dart';
part 'reservation_state.dart';

@Singleton()
class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  final GetReservationInfoUsecase getReservationInfoUsecase;

  ReservationBloc({required this.getReservationInfoUsecase}) : super(InitialReservationState()) {
    on<InitReservationEvent>(_onInitReservationEvent);
    on<AddTouristReservationEvent>(_onAddTouristReservationBlocEvent);
    on<CheckTextFieldsReservationEvent>(_onCheckTextFieldsReservationBlocEvent);

    if (state is InitialReservationState) {
      add(InitReservationEvent());
    }
  }

  bool _checkReservation({
    required GlobalKey<FormState> headerKey,
    required List<GlobalKey<FormState>> keyList,
  }) {
    final isFilled = headerKey.currentState?.validate();
    if (isFilled == null) return false;
    return isFilled && !keyList.map((e) => e.currentState?.validate()).contains(false);
  }

  FutureOr<void> _onInitReservationEvent(
    InitReservationEvent event,
    Emitter<ReservationState> emit,
  ) async {
    final Either<Failure, ReservationModel> res = await getReservationInfoUsecase.call(NoParams());

    res.fold(
      (l) => null,
      (r) => emit(MainReservationState(
        emailTextEditingController: TextEditingController(),
        phoneNumberTextEditingController: TextEditingController(),
        touristCount: 1,
        touristCardInfo: [
          TouristCardInfo(
            stateKey: GlobalKey<FormState>(),
            nameTextEditingController: TextEditingController(),
            abroadPasportNumberTextEditingController: TextEditingController(),
            abroadPasportValidityTextEditingController: TextEditingController(),
            citizenshipTextEditingController: TextEditingController(),
            dateOfBirthTextEditingController: TextEditingController(),
            surnameTextEditingController: TextEditingController(),
          )
        ],
        reservationModel: r,
        headerKey: GlobalKey<FormState>(),
      )),
    );
  }

  FutureOr<void> _onAddTouristReservationBlocEvent(
    AddTouristReservationEvent event,
    Emitter<ReservationState> emit,
  ) async {
    if (state is! MainReservationState) return;

    final currentState = (state as MainReservationState);

    emit(MainReservationState(
      reservationModel: currentState.reservationModel,
      emailTextEditingController: currentState.emailTextEditingController,
      phoneNumberTextEditingController: currentState.phoneNumberTextEditingController,
      touristCount: currentState.touristCount + 1,
      touristCardInfo: [
        ...currentState.touristCardInfo,
        TouristCardInfo(
          stateKey: GlobalKey<FormState>(),
          nameTextEditingController: TextEditingController(),
          abroadPasportNumberTextEditingController: TextEditingController(),
          abroadPasportValidityTextEditingController: TextEditingController(),
          citizenshipTextEditingController: TextEditingController(),
          dateOfBirthTextEditingController: TextEditingController(),
          surnameTextEditingController: TextEditingController(),
        ),
      ],
      headerKey: GlobalKey(),
    ));
  }

  FutureOr<void> _onCheckTextFieldsReservationBlocEvent(
    CheckTextFieldsReservationEvent event,
    Emitter<ReservationState> emit,
  ) async {
    if (state is! MainReservationState) return;

    final currentState = (state as MainReservationState);

    final keyList = List.generate(
      currentState.touristCardInfo.length,
      (index) => currentState.touristCardInfo[index].stateKey,
    );

    final isTextFieldsChecked = _checkReservation(
      headerKey: currentState.headerKey,
      keyList: keyList,
    );

    if (isTextFieldsChecked) {
      await Navigator.of(event.context).pushReplacementNamed(PaidPage.name, arguments: true);
      _disposeStreams(currentState);

      emit(MainReservationState(
        emailTextEditingController: TextEditingController(),
        phoneNumberTextEditingController: TextEditingController(),
        headerKey: GlobalKey(),
        touristCount: 1,
        touristCardInfo: [
          TouristCardInfo(
            stateKey: GlobalKey<FormState>(),
            nameTextEditingController: TextEditingController(),
            abroadPasportNumberTextEditingController: TextEditingController(),
            abroadPasportValidityTextEditingController: TextEditingController(),
            citizenshipTextEditingController: TextEditingController(),
            dateOfBirthTextEditingController: TextEditingController(),
            surnameTextEditingController: TextEditingController(),
          )
        ],
        reservationModel: currentState.reservationModel,
      ));
    } else {
      emit(MainReservationState(
        reservationModel: currentState.reservationModel,
        emailTextEditingController: currentState.emailTextEditingController,
        phoneNumberTextEditingController: currentState.phoneNumberTextEditingController,
        touristCount: currentState.touristCount,
        touristCardInfo: currentState.touristCardInfo,
        repaintAll: true,
        isTextFieldsFilled: false,
        headerKey: currentState.headerKey,
      ));
    }
  }

  void _disposeStreams(MainReservationState currentState) {
    currentState.headerKey.currentState?.dispose();
    for (var element in currentState.touristCardInfo) {
      element.abroadPasportNumberTextEditingController.dispose();
      element.abroadPasportValidityTextEditingController.dispose();
      element.citizenshipTextEditingController.dispose();
      element.dateOfBirthTextEditingController.dispose();
      element.nameTextEditingController.dispose();
      element.surnameTextEditingController.dispose();
      element.stateKey.currentState?.dispose();
    }
    currentState.emailTextEditingController.dispose();
    currentState.phoneNumberTextEditingController.dispose();
  }
}
