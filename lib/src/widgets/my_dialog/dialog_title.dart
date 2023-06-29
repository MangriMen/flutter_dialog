import 'package:flutter/material.dart';

class DialogTitle extends StatelessWidget {
  const DialogTitle({
    super.key,
    required this.text,
  });

  final String text;

  static const double titleFontSize = 18;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 16,
      ),
      child: Text(
        style: Theme.of(context).textTheme.titleLarge,
        text,
      ),
    );
  }
}
