import 'package:flutter/material.dart';

class StandardScaffold extends StatelessWidget {
  final bool standartBackgroundColor;
  final bool arrowBack;
  final String title;
  final Widget child;

  const StandardScaffold({
    super.key,
    this.standartBackgroundColor = true,
    required this.child,
    required this.title,
    required this.arrowBack,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: standartBackgroundColor ? colorScheme.background : Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: arrowBack
            ? GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const Icon(Icons.arrow_back_ios),
              )
            : null,
        actions: const [
          SizedBox(
            width: 36.0,
            height: 36.0,
          )
        ],
        title: Text(
          title,
          textAlign: TextAlign.center,
          maxLines: 2,
          style: textTheme.titleMedium,
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        centerTitle: true,
      ),
      body: child,
    );
  }
}
