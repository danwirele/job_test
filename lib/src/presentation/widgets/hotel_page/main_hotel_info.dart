import 'package:flutter/material.dart';
import 'package:job_test/core/extensions/string.dart';
import 'package:job_test/src/presentation/widgets/common/hotel_rating.dart';

class MainHotelInfo extends StatelessWidget {
  final String name;
  final String adress;
  final String minimalPrice;
  final String priceForIt;
  final String rating;
  final String ratingName;

  const MainHotelInfo({
    super.key,
    required this.name,
    required this.adress,
    required this.minimalPrice,
    required this.priceForIt,
    required this.rating,
    required this.ratingName,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: HotelRating(
              rating: rating,
              ratingName: ratingName,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              name,
              style: textTheme.titleLarge,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              adress,
              style: textTheme.labelSmall?.copyWith(
                color: colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.ideographic,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'от ${minimalPrice.toString().spaceSeparateNumbers()} ₽',
                  style: textTheme.bodyLarge,
                ),
                Text(
                  priceForIt,
                  style: textTheme.labelSmall?.copyWith(color: const Color(0xFF828796)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
