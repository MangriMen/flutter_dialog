import 'package:flutter/material.dart';

import 'my_dialog/my_dialog.dart';

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
                  builder: (BuildContext context) => const MyDialog(),
                ),
            child: const Text("Открыть диалог")),
      ),
    );
  }
}
