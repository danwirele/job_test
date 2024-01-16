import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'services.config.dart';

GetIt services = GetIt.instance;

@InjectableInit()
FutureOr<void> initServices() async {
  services.init();
}
