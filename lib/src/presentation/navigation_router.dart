import 'package:flutter/material.dart';
import 'package:job_test/src/presentation/pages/hotel_page.dart';
import 'package:job_test/src/presentation/pages/paid_page.dart';
import 'package:job_test/src/presentation/pages/reservation_page.dart';
import 'package:job_test/src/presentation/pages/room_page.dart';

class NavigationRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HotelPage.name:
        return MaterialPageRoute(
            builder: (context) => HotelPage(
                  arrowBack: (settings.arguments != null) ? true : false,
                ));
      case PaidPage.name:
        return MaterialPageRoute(
            builder: (context) => PaidPage(
                  arrowBack: (settings.arguments != null) ? true : false,
                ));
      case ReservationPage.name:
        return MaterialPageRoute(
            builder: (context) => ReservationPage(
                  arrowBack: (settings.arguments != null) ? true : false,
                ));
      case RoomPage.name:
        return MaterialPageRoute(
            builder: (context) => RoomPage(
                  arrowBack: (settings.arguments != null) ? true : false,
                ));

      default:
    }
    return null;
  }
}
