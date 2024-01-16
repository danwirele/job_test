import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:job_test/core/failure/failure.dart';
import 'package:job_test/core/usecase/usecase.dart';
import 'package:job_test/src/data/model/hotel_model.dart';
import 'package:job_test/src/domain/usecases/get_hotel_info_usecase.dart';

part 'hotel_event.dart';
part 'hotel_state.dart';

@Singleton()
class HotelBloc extends Bloc<HotelEvent, HotelState> {
  final GetHotelInfoUsecase getHotelInfoUsecaseById;

  HotelBloc({required this.getHotelInfoUsecaseById}) : super(InitialHotelState()) {
    on<InitHotelEvent>(_onInitHotelEvent);

    if (state is InitialHotelState) {
      add(InitHotelEvent());
    }
  }

  FutureOr<void> _onInitHotelEvent(
    InitHotelEvent event,
    Emitter<HotelState> emit,
  ) async {
    final Either<Failure, HotelModel> res = await getHotelInfoUsecaseById.call(NoParams());

    res.fold(
      (l) => null,
      (r) => emit(
        LoadedHotelState(
          hotelModel: r..peculiarities.sort((a, b) => a.length.compareTo(b.length)),
        ),
      ),
    );
  }
}
