import 'package:flutter/material.dart';
import 'package:flutter_dialog/src/constants.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<StatefulWidget> createState() => _Page1State();
}

class _Page1State extends State<Page1>
    with AutomaticKeepAliveClientMixin<Page1> {
  @override
  bool get wantKeepAlive => true;

  static const _labelStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );

  static const _hintStyle = TextStyle(
    color: AppColors.textDimmed,
  );

  bool checkboxValue1 = true;
  bool checkboxValue2 = true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Wrap(
      runSpacing: 16,
      children: <Widget>[
        Wrap(
          runSpacing: 8,
          children: [
            const Text(
              style: _labelStyle,
              "Наименование",
            ),
            SizedBox(
              height: 40,
              child: TextFormField(
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                ),
                decoration: const InputDecoration(
                  hintStyle: _hintStyle,
                  hintText: "Выбрать",
                ),
              ),
            ),
          ],
        ),
        Wrap(
          runSpacing: 8,
          children: [
            const Text(
              style: _labelStyle,
              "Сумма",
            ),
            SizedBox(
              height: 40,
              child: TextFormField(
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                ),
                decoration: const InputDecoration(
                  hintStyle: _hintStyle,
                  hintText: "Введите сумму",
                ),
              ),
            )
          ],
        ),
        Wrap(
          runSpacing: 8,
          children: [
            const Text(
              style: _labelStyle,
              "Пример списка с чекбоксами",
            ),
            Column(
              children: <Widget>[
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.bodyMedium?.fontSize,
                    ),
                    "Элемент списка 1",
                  ),
                  value: checkboxValue1,
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxValue1 = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.bodyMedium?.fontSize,
                    ),
                    "Элемент списка 2",
                  ),
                  value: checkboxValue2,
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxValue2 = value!;
                    });
                  },
                ),
              ],
            )
          ],
        ),
        Wrap(
          runSpacing: 8,
          children: [
            const Text(
              style: _labelStyle,
              "Комментарий",
            ),
            TextFormField(
              minLines: 4,
              maxLines: 4,
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
              ),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(16),
              ),
              initialValue: "Мой новый комментарий",
            ),
          ],
        ),
      ],
    );
  }
}
