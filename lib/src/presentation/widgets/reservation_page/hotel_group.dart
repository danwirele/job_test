import 'package:flutter/material.dart';
import 'package:job_test/src/presentation/widgets/common/hotel_rating.dart';
import 'package:job_test/src/presentation/widgets/common/standard_card.dart';

class HotelGroup extends StatelessWidget {
  final String name;
  final String rating;
  final String ratingName;
  final String adress;

  const HotelGroup({
    super.key,
    required this.rating,
    required this.ratingName,
    required this.name,
    required this.adress,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return StandardCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 8),
            child: HotelRating(rating: rating, ratingName: ratingName),
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
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
            child: Text(
              adress,
              style: textTheme.labelSmall?.copyWith(color: colorScheme.primary),
            ),
          ),
        ],
      ),
    );
  }
}
