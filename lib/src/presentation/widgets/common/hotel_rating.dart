import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HotelRating extends StatelessWidget {
  final String rating;
  final String ratingName;

  const HotelRating({
    super.key,
    required this.rating,
    required this.ratingName,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: const Color(0xFFFFC700).withOpacity(0.2),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/icons/star.svg',
                width: 15,
                height: 15,
                colorFilter: const ColorFilter.mode(
                  Color(0xFFFFA800),
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 2),
              Text(
                '$rating $ratingName',
                style: textTheme.labelMedium?.copyWith(color: const Color(0xFFFFA800)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
