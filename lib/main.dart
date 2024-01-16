import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:job_test/core/services/services.config.dart';
import 'package:job_test/core/services/services.dart';
import 'package:job_test/src/presentation/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  services.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.white,
    ),
  );

  runApp(const App());
}
