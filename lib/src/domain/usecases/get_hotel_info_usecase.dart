import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:job_test/core/failure/failure.dart';
import 'package:job_test/core/usecase/usecase.dart';
import 'package:job_test/src/data/model/hotel_model.dart';
import 'package:job_test/src/data/repostiories_impl/hotel_repository_impl.dart';

@Injectable()
class GetHotelInfoUsecase extends UseCase<HotelModel, NoParams> {
  @override
  FutureOr<Either<Failure, HotelModel>> call(NoParams params) async {
    return Right(await HotelRepositoryImpl(Dio()).getHotelInfo());
  }
}
