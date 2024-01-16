import 'package:flutter/material.dart';

class StandardCard extends StatelessWidget {
  final Widget child;

  const StandardCard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(8.0),
      child: child,
    );
  }
}
