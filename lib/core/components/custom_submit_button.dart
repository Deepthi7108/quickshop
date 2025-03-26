import 'package:flutter/material.dart';

class CustomSubmitButton extends StatelessWidget {
  Function function;
  CustomSubmitButton({super.key, required this.function});

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
          child: Text("Submit",
              style:
                  textTheme.bodyMedium?.copyWith(color: colorScheme.surface))),
    );
  }
}
