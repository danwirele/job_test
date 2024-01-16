import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GroupedButton extends StatelessWidget {
  final String iconPath;
  final String upperText;

  const GroupedButton({
    super.key,
    required this.iconPath,
    required this.upperText,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: const Color(0xFFFBFBFC),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        onTap: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(iconPath),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  upperText,
                  style: textTheme.labelMedium,
                ),
                Text(
                  'Самое необходимое',
                  style: textTheme.labelSmall?.copyWith(
                    color: const Color(0xFF828796),
                  ),
                ),
              ],
            ),
            const Spacer(),
            SvgPicture.asset(
              'assets/icons/arrow_right.svg',
              colorFilter: const ColorFilter.mode(
                Color(0xFF2C3035),
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
