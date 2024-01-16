import 'dart:math';

import 'package:flutter/material.dart';
import 'package:job_test/core/services/services.dart';
import 'package:job_test/src/presentation/bloc/reservation/reservation_bloc.dart';
import 'package:job_test/src/presentation/pages/hotel_page.dart';
import 'package:job_test/src/presentation/widgets/common/standard_filled_button.dart';
import 'package:job_test/src/presentation/widgets/common/standard_scaffold.dart';

class PaidPage extends StatelessWidget {
  static const name = 'paid';
  final bool arrowBack;

  const PaidPage({
    super.key,
    required this.arrowBack,
  });

  @override
  Widget build(BuildContext context) {
    final bookingNumber = (Random().nextInt(200000) + 100000).toString();
    final textTheme = Theme.of(context).textTheme;
    return StandardScaffold(
        standartBackgroundColor: false,
        title: 'Заказ оплачен',
        arrowBack: arrowBack,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            CircleAvatar(
              radius: 47,
              backgroundColor: const Color(0xFFF6F6F9),
              child: Image.asset('assets/images/Party Popper.png'),
            ),
            const SizedBox(height: 32),
            Text(
              'Ваш заказ принят в работу',
              style: textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Text(
                'Подтверждение заказа №$bookingNumber может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.',
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: StandardFilledButton(
                  text: 'Супер!',
                  onTap: () {
                    Navigator.of(context).pushNamed(HotelPage.name);
                    services<ReservationBloc>().add(InitReservationEvent());
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
