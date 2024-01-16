import 'package:flutter/material.dart';

class StandardChip extends StatelessWidget {
  final String text;

  const StandardChip({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.transparent,
      ),
      child: Chip(
        label: Text(
          text,
          style: textTheme.labelMedium?.copyWith(color: const Color(0xFF828796)),
        ),
        backgroundColor: const Color(0xFFFBFBFC),
        side: BorderSide.none,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
      ),
    );
  }
}
