import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Mulish",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextButton(
                onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) => const MyDialog()),
                child: const Text("Открыть диалог")),
          ],
        ),
      ),
    );
  }
}

class MyDialog extends StatefulWidget {
  const MyDialog({super.key});

  @override
  State<StatefulWidget> createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 2, vsync: this);

  static const _tabLabelStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Wrap(
        runSpacing: 16,
        children: <Widget>[
          const Wrap(
            children: [
              Text(
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                "Заголовок",
              ),
              Divider()
            ],
          ),
          TabBar(
            labelStyle: _tabLabelStyle,
            labelColor: const Color.fromRGBO(37, 39, 51, 1.0),
            unselectedLabelColor: const Color.fromRGBO(153, 166, 183, 1.0),
            indicatorColor: const Color.fromRGBO(55, 125, 255, 1.0),
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: const <Widget>[
              Tab(text: "Вкладка 1"),
              Tab(text: "Вкладка 2")
            ],
          ),
          SizedBox(
            width: double.maxFinite,
            height: 460,
            child: TabBarView(
              controller: _tabController,
              children: const <Widget>[
                Page1(),
                Page2(),
              ],
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Отмена"),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Добавить"),
        ),
      ],
      actionsAlignment: MainAxisAlignment.center,
    );
  }
}

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<StatefulWidget> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  static const _labelStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static const _checkboxLabelStyle = TextStyle(
    fontSize: 14,
  );

  static const _hintStyle = TextStyle(
    fontSize: 14,
    color: Color.fromRGBO(153, 166, 183, 1.0),
  );

  bool checkboxValue1 = true;
  bool checkboxValue2 = true;

  @override
  Widget build(BuildContext context) {
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
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
                hintText: "Выбрать",
                hintStyle: _hintStyle,
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
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
                hintText: "Введите сумму",
                hintStyle: _hintStyle,
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
                  contentPadding: const EdgeInsets.all(0),
                  value: checkboxValue1,
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxValue1 = value!;
                    });
                  },
                  title: const Text(
                    style: _checkboxLabelStyle,
                    "Элемент списка 1",
                  ),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: const EdgeInsets.all(0),
                  value: checkboxValue1,
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxValue1 = value!;
                    });
                  },
                  title: const Text(
                    style: _checkboxLabelStyle,
                    "Элемент списка 2",
                  ),
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
              minLines: 5,
              maxLines: 5,
              initialValue: "Мой новый комментарий",
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<StatefulWidget> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  late final _dropDownMenuEntries = const <DropdownMenuEntry>[
    DropdownMenuEntry(value: 1, label: "Вариант 1"),
    DropdownMenuEntry(value: 2, label: "Вариант 2"),
    DropdownMenuEntry(value: 3, label: "Вариант 3"),
    DropdownMenuEntry(value: 4, label: "Вариант 4"),
    DropdownMenuEntry(value: 5, label: "Вариант 5"),
  ];

  static const _labelStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
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
              hintText: "Выбрать",
              dropdownMenuEntries: _dropDownMenuEntries,
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
              hintText: "Выбрать",
              dropdownMenuEntries: _dropDownMenuEntries,
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
              hintText: "Выбрать",
              dropdownMenuEntries: _dropDownMenuEntries,
            ),
          ],
        ),
      ],
    );
  }
}
