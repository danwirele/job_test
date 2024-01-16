import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:job_test/src/data/model/hotel_model.dart';
import 'package:job_test/src/data/model/reservation_model.dart';
import 'package:job_test/src/data/model/room_model.dart';

part 'hotel_repository_impl.g.dart';

@RestApi(baseUrl: 'https://run.mocky.io/v3/')
abstract class HotelRepositoryImpl {
  factory HotelRepositoryImpl(Dio dio, {String baseUrl}) = _HotelRepositoryImpl;

  @GET('d144777c-a67f-4e35-867a-cacc3b827473')
  Future<HotelModel> getHotelInfo();

  @GET('8b532701-709e-4194-a41c-1a903af00195')
  Future<ListRooms> getAllRoomsInfo();

  @GET('63866c74-d593-432c-af8e-f279d1a8d2ff')
  Future<ReservationModel> getReservationInfo();
}
