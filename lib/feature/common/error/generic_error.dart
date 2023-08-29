import 'package:flutter/material.dart';

class GenericError extends StatelessWidget {
  final String message;
  final VoidCallback? onRetryClicked;

  const GenericError({super.key, required this.message, this.onRetryClicked});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
        if (onRetryClicked != null) ...[
          const SizedBox.square(dimension: 32.0),
          ElevatedButton(
              onPressed: () => onRetryClicked?.call(),
              child: const Text("Retry"))
        ]
      ],
    );
  }
}
