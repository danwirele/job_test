import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_test/core/services/services.dart';
import 'package:job_test/src/presentation/app_theme.dart';
import 'package:job_test/src/presentation/bloc/hotel/hotel_bloc.dart';
import 'package:job_test/src/presentation/bloc/reservation/reservation_bloc.dart';
import 'package:job_test/src/presentation/bloc/room/room_bloc.dart';
import 'package:job_test/src/presentation/navigation_router.dart';
import 'package:job_test/src/presentation/pages/hotel_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => services<ReservationBloc>()),
        BlocProvider(create: (context) => services<HotelBloc>()),
        BlocProvider(create: (context) => services<RoomBloc>()),
      ],
      child: MaterialApp(
        theme: AppTheme.appTheme,
        initialRoute: HotelPage.name,
        onGenerateRoute: NavigationRouter.onGenerateRoute,
      ),
    );
  }
}
