part of 'hotel_bloc.dart';

sealed class HotelState extends Equatable {
  const HotelState();

  @override
  List<Object> get props => [];
}

final class LoadedHotelState extends HotelState {
  final HotelModel hotelModel;

  const LoadedHotelState({required this.hotelModel});

  @override
  List<Object> get props => [hotelModel];
}

final class InitialHotelState extends HotelState {}
