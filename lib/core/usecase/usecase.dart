import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:job_test/core/failure/failure.dart';

abstract class UseCase<ReturnType, ParamsType> {
  FutureOr<Either<Failure, ReturnType>> call(ParamsType params);
}

class NoParams {}
