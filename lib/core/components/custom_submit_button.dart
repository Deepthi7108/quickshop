import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  Function function;
  String text;
  CustomButton({super.key, required this.function, required this.text});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: 40,
      width: 100,
      decoration: BoxDecoration(color: colorScheme.primary),
      child: TextButton(
          onPressed: () => function(),
          child: Text(text,
              style:
                  textTheme.bodyMedium?.copyWith(color: colorScheme.surface))),
    );
  }
}
