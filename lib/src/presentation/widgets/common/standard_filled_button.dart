import 'package:flutter/material.dart';

class StandardFilledButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const StandardFilledButton({
    super.key,
    this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return FilledButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size.zero,
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 0,
        backgroundColor: colorScheme.primary,
      ),
      onPressed: onTap,
      child: Text(
        text,
        style: textTheme.labelMedium?.copyWith(color: Colors.white),
      ),
    );
  }
}
