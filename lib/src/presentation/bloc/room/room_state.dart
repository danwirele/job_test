part of 'room_bloc.dart';

sealed class RoomState extends Equatable {
  const RoomState();

  @override
  List<Object> get props => [];
}

final class LoadedRoomState extends RoomState {
  final ListRooms listRooms;

  const LoadedRoomState({required this.listRooms});

  @override
  List<Object> get props => [listRooms];
}

final class InitialRoomState extends RoomState {}
