import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<StatefulWidget> createState() => _Page2State();
}

class _Page2State extends State<Page2>
    with AutomaticKeepAliveClientMixin<Page2> {
  @override
  bool get wantKeepAlive => true;

  late final _dropDownMenuEntries = const <DropdownMenuEntry>[
    DropdownMenuEntry(value: 1, label: "Вариант 1"),
    DropdownMenuEntry(value: 2, label: "Вариант 2"),
    DropdownMenuEntry(value: 3, label: "Вариант 3"),
    DropdownMenuEntry(value: 4, label: "Вариант 4"),
    DropdownMenuEntry(value: 5, label: "Вариант 5"),
  ];

  static const _labelStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Wrap(
      direction: Axis.vertical,
      spacing: 16,
      children: <Widget>[
        Wrap(
          direction: Axis.vertical,
          spacing: 8,
          children: [
            const Text(
              style: _labelStyle,
              "Организация",
            ),
            DropdownMenu(
              width: 380,
              dropdownMenuEntries: _dropDownMenuEntries,
              hintText: "Выбрать",
            ),
          ],
        ),
        Wrap(
          direction: Axis.vertical,
          spacing: 8,
          children: [
            const Text(
              style: _labelStyle,
              "Контрагент",
            ),
            DropdownMenu(
              width: 380,
              dropdownMenuEntries: _dropDownMenuEntries,
              hintText: "Выбрать",
            ),
          ],
        ),
        Wrap(
          direction: Axis.vertical,
          spacing: 8,
          children: [
            const Text(
              style: _labelStyle,
              "Договор",
            ),
            DropdownMenu(
              width: 380,
              dropdownMenuEntries: _dropDownMenuEntries,
              hintText: "Выбрать",
            ),
          ],
        ),
      ],
    );
  }
}
