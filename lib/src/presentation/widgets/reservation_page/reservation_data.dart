import 'package:flutter/material.dart';
import 'package:job_test/src/presentation/widgets/common/standard_card.dart';

class ReservationData extends StatelessWidget {
  static const rowSpacer = TableRow(children: [SizedBox(height: 16), SizedBox(height: 16)]);

  final String departure;
  final String arrivalCountry;
  final String tourDateStart;
  final String tourDateStop;
  final String numberOfNights;
  final String hotelName;
  final String room;
  final String nutrition;
  const ReservationData({
    super.key,
    required this.departure,
    required this.arrivalCountry,
    required this.tourDateStart,
    required this.tourDateStop,
    required this.numberOfNights,
    required this.hotelName,
    required this.room,
    required this.nutrition,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return StandardCard(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          columnWidths: const {1: FractionColumnWidth(0.63)},
          children: [
            TableRow(
              children: [
                Text(
                  'Вылет из',
                  style: textTheme.bodyMedium?.copyWith(color: Color(0xFF828796)),
                ),
                Text(departure),
              ],
            ),
            rowSpacer,
            TableRow(
              children: [
                Text(
                  'Страна, город',
                  style: textTheme.bodyMedium?.copyWith(color: Color(0xFF828796)),
                ),
                Text(arrivalCountry),
              ],
            ),
            rowSpacer,
            TableRow(
              children: [
                Text(
                  'Даты',
                  style: textTheme.bodyMedium?.copyWith(color: Color(0xFF828796)),
                ),
                Text('$tourDateStart-$tourDateStop'),
              ],
            ),
            rowSpacer,
            TableRow(
              children: [
                Text(
                  'Кол-во ночей',
                  style: textTheme.bodyMedium?.copyWith(color: Color(0xFF828796)),
                ),
                Text(numberOfNights),
              ],
            ),
            rowSpacer,
            TableRow(
              children: [
                Text(
                  'Отель',
                  style: textTheme.bodyMedium?.copyWith(color: Color(0xFF828796)),
                ),
                Text(hotelName),
              ],
            ),
            rowSpacer,
            TableRow(
              children: [
                Text(
                  'Номер',
                  style: textTheme.bodyMedium?.copyWith(color: Color(0xFF828796)),
                ),
                Text(room),
              ],
            ),
            rowSpacer,
            TableRow(
              children: [
                Text(
                  'Питание',
                  style: textTheme.bodyMedium?.copyWith(color: Color(0xFF828796)),
                ),
                Text(nutrition),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
