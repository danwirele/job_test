// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:job_test/src/domain/usecases/get_hotel_info_usecase.dart'
    as _i3;
import 'package:job_test/src/domain/usecases/get_reservation_info_usecase.dart'
    as _i4;
import 'package:job_test/src/domain/usecases/get_rooms_info_usecase.dart'
    as _i5;
import 'package:job_test/src/presentation/bloc/hotel/hotel_bloc.dart' as _i6;
import 'package:job_test/src/presentation/bloc/reservation/reservation_bloc.dart'
    as _i7;
import 'package:job_test/src/presentation/bloc/room/room_bloc.dart' as _i8;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.GetHotelInfoUsecase>(() => _i3.GetHotelInfoUsecase());
    gh.factory<_i4.GetReservationInfoUsecase>(
        () => _i4.GetReservationInfoUsecase());
    gh.factory<_i5.GetRoomsInfoUsecase>(() => _i5.GetRoomsInfoUsecase());
    gh.singleton<_i6.HotelBloc>(
        _i6.HotelBloc(getHotelInfoUsecaseById: gh<_i3.GetHotelInfoUsecase>()));
    gh.singleton<_i7.ReservationBloc>(_i7.ReservationBloc(
        getReservationInfoUsecase: gh<_i4.GetReservationInfoUsecase>()));
    gh.singleton<_i8.RoomBloc>(
        _i8.RoomBloc(getRoomsInfoUsecase: gh<_i5.GetRoomsInfoUsecase>()));
    return this;
  }
}
