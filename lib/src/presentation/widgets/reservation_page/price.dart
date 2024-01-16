import 'package:flutter/material.dart';
import 'package:job_test/core/extensions/string.dart';
import 'package:job_test/src/presentation/widgets/common/standard_card.dart';

class Price extends StatelessWidget {
  final int tourPrice;
  final int fuelCharge;
  final int serviceCharge;
  const Price({
    super.key,
    required this.tourPrice,
    required this.fuelCharge,
    required this.serviceCharge,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return StandardCard(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Тур',
                  style: textTheme.bodyMedium?.copyWith(color: const Color(0xFF828796)),
                ),
                Text('${tourPrice.toString().spaceSeparateNumbers()} ₽'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Топливный сбор',
                  style: textTheme.bodyMedium?.copyWith(color: const Color(0xFF828796)),
                ),
                Text('${fuelCharge.toString().spaceSeparateNumbers()} ₽'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Сервисный сбор',
                  style: textTheme.bodyMedium?.copyWith(color: const Color(0xFF828796)),
                ),
                Text('${serviceCharge.toString().spaceSeparateNumbers()} ₽'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'К оплате',
                  style: textTheme.bodyMedium?.copyWith(color: const Color(0xFF828796)),
                ),
                Text('${(tourPrice + fuelCharge + serviceCharge).toString().spaceSeparateNumbers()} ₽'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
