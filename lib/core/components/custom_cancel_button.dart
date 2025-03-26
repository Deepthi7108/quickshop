import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCancelButton extends StatelessWidget {
  const CustomCancelButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Container(
        height: 40,
        width: 100,
        decoration: BoxDecoration(color: colorScheme.tertiary),
        child: TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel",
                style: textTheme.bodyMedium
                    ?.copyWith(color: colorScheme.surface))));
  }
}
