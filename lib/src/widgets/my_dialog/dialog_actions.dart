import 'package:flutter/material.dart';

class DialogActions extends StatelessWidget {
  const DialogActions({
    super.key,
  });

  static const double actionHeight = 36;
  static const double actionWidth = 150;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Отмена"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Добавить"),
        ),
      ]
          .map(
            (widget) => SizedBox(
              height: actionHeight,
              width: actionWidth,
              child: widget,
            ),
          )
          .toList(),
    );
  }
}
