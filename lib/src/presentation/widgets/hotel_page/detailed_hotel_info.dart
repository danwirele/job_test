import 'package:flutter/material.dart';
import 'package:job_test/src/data/model/hotel_model.dart';
import 'package:job_test/src/presentation/widgets/hotel_page/grouped_button.dart';
import 'package:job_test/src/presentation/widgets/common/standard_chip.dart';

class DetailedHotelInfo extends StatelessWidget {
  final HotelModel hotel;

  const DetailedHotelInfo({
    super.key,
    required this.hotel,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
            child: Text(
              'Об отеле',
              style: textTheme.titleLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Wrap(
              spacing: 8,
              children: List.generate(
                growable: true,
                hotel.peculiarities.length,
                (index) => StandardChip(
                  text: hotel.peculiarities[index],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              hotel.description,
              style: textTheme.bodyMedium,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            decoration: const BoxDecoration(color: Color(0xFFFBFBFC), borderRadius: BorderRadius.all(Radius.circular(15))),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 15,
                  ),
                  child: GroupedButton(
                    iconPath: 'assets/icons/emoji-happy.svg',
                    upperText: 'Удобства',
                  ),
                ),
                Divider(
                  indent: 53,
                  endIndent: 15,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  child: GroupedButton(
                    iconPath: 'assets/icons/tick-square.svg',
                    upperText: 'Что включено',
                  ),
                ),
                Divider(
                  indent: 53,
                  endIndent: 15,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                    bottom: 15,
                  ),
                  child: GroupedButton(
                    iconPath: 'assets/icons/close-square.svg',
                    upperText: 'Что не включено',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
