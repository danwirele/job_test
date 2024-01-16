import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_test/core/extensions/string.dart';
import 'package:job_test/src/data/model/room_model.dart';
import 'package:job_test/src/presentation/widgets/hotel_page/carousel_slider.dart';
import 'package:job_test/src/presentation/pages/reservation_page.dart';
import 'package:job_test/src/presentation/widgets/common/standard_chip.dart';
import 'package:job_test/src/presentation/widgets/common/standard_filled_button.dart';

class RoomCard extends StatelessWidget {
  final Room room;

  const RoomCard({
    super.key,
    required this.room,
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
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
            child: CarouselSlider(imageList: room.imageUrls),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              room.name,
              style: textTheme.titleLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Wrap(
              spacing: 8,
              children: List.generate(
                room.peculiarities.length,
                (index) {
                  return StandardChip(
                    text: room.peculiarities.elementAt(index),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 4),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minimumSize: Size.zero,
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                elevation: 0,
                backgroundColor: colorScheme.primary.withOpacity(0.1),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Подробности о номере',
                    style: textTheme.labelMedium?.copyWith(color: colorScheme.primary),
                  ),
                  SvgPicture.asset(
                    'assets/icons/arrow_right.svg',
                    colorFilter: const ColorFilter.mode(
                      Color(0xFF0272FF),
                      BlendMode.srcIn,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.ideographic,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${room.price.toString().spaceSeparateNumbers()} ₽',
                  style: textTheme.bodyLarge,
                ),
                const SizedBox(width: 8),
                Text(
                  room.pricePer,
                  style: textTheme.bodyMedium?.copyWith(color: const Color(0xFF828796)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: StandardFilledButton(
                text: 'Выбрать номер',
                onTap: () => Navigator.of(context).pushNamed(ReservationPage.name, arguments: true),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
