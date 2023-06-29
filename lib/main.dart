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
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          textTheme: const TextTheme(
            titleMedium: TextStyle(
              color: Color.fromRGBO(50, 60, 71, 1),
            ),
          ),
          dropdownMenuTheme: const DropdownMenuThemeData(
            inputDecorationTheme: InputDecorationTheme(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(235, 239, 242, 1)),
              ),
            ),
          ),
          checkboxTheme: CheckboxThemeData(
            fillColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (!states.contains(MaterialState.selected)) {
                  return const Color.fromRGBO(235, 239, 242, 1);
                }
                return const Color.fromRGBO(55, 125, 255, 1);
              },
            ),
          ),
          tabBarTheme: const TabBarTheme(
            labelColor: Color.fromRGBO(37, 39, 51, 1),
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            unselectedLabelColor: Color.fromRGBO(153, 166, 183, 1),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            indicatorSize: TabBarIndicatorSize.label,
          )
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
        child: TextButton(
            onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) => const MyDialog()),
            child: const Text("Открыть диалог")),
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

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: const BoxConstraints.tightFor(
                width: 446,
                height: 671,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 32, vertical: 16.0),
                    child: Text(
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      "Заголовок",
                    ),
                  ),
                  const Divider(
                    height: 0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TabBar(
                      indicatorColor: const Color.fromRGBO(55, 125, 255, 1),
                      isScrollable: true,
                      controller: _tabController,
                      tabs: const <Widget>[
                        Tab(text: "Вкладка 1"),
                        Tab(text: "Вкладка 2")
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 16.0),
                      child: TabBarView(
                        controller: _tabController,
                        children: const <Widget>[
                          Page1(),
                          Page2(),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 32.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton(
                          style: const ButtonStyle(
                            padding: MaterialStatePropertyAll(
                              EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 17),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Отмена"),
                        ),
                        ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                              Color.fromRGBO(50, 60, 71, 1),
                            ),
                            padding: MaterialStatePropertyAll(
                              EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 17),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Добавить"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

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
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static const _checkboxLabelStyle = TextStyle(
    fontSize: 14,
  );

  static const _hintStyle = TextStyle(
    fontSize: 14,
    color: Color.fromRGBO(153, 166, 183, 1),
  );

  static const _textFieldBorderStyle = OutlineInputBorder(
    borderSide: BorderSide(
      color: Color.fromRGBO(235, 239, 242, 1),
    ),
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
                style: const TextStyle(fontSize: 14),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: _textFieldBorderStyle,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                  hintText: "Выбрать",
                  hintStyle: _hintStyle,
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
                style: const TextStyle(fontSize: 14),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: _textFieldBorderStyle,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                  hintText: "Введите сумму",
                  hintStyle: _hintStyle,
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
                  contentPadding: const EdgeInsets.all(0),
                  title: const Text(
                    style: _checkboxLabelStyle,
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
                  contentPadding: const EdgeInsets.all(0),
                  title: const Text(
                    style: _checkboxLabelStyle,
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
              initialValue: "Мой новый комментарий",
              style: const TextStyle(fontSize: 14),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                enabledBorder: _textFieldBorderStyle,
              ),
            ),
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
    fontSize: 14,
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
