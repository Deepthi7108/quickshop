import 'package:flutter/material.dart';

class CustomHeaderText extends StatelessWidget {
  String text;
  CustomHeaderText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Text(
      text,
      style: textTheme.headlineSmall!.copyWith(color: colorScheme.tertiary),
    );
  }
}
