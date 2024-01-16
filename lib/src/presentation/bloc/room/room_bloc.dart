import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:job_test/core/failure/failure.dart';
import 'package:job_test/core/usecase/usecase.dart';
import 'package:job_test/src/data/model/room_model.dart';
import 'package:job_test/src/domain/usecases/get_rooms_info_usecase.dart';

part 'room_event.dart';
part 'room_state.dart';

@Singleton()
class RoomBloc extends Bloc<RoomEvent, RoomState> {
  final GetRoomsInfoUsecase getRoomsInfoUsecase;

  RoomBloc({required this.getRoomsInfoUsecase}) : super(InitialRoomState()) {
    on<InitRoomEvent>(_onInitRoomEvent);

    if (state is InitialRoomState) {
      add(InitRoomEvent());
    }
  }

  FutureOr<void> _onInitRoomEvent(
    InitRoomEvent event,
    Emitter<RoomState> emit,
  ) async {
    final Either<Failure, ListRooms> res = await getRoomsInfoUsecase.call(NoParams());

    res.fold(
      (l) => null,
      (r) => emit(
        LoadedRoomState(
          listRooms: r..rooms.map((e) => e.peculiarities.sort((a, b) => a.length.compareTo(b.length))),
        ),
      ),
    );
  }
}
