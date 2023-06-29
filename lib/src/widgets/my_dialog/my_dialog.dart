import 'package:flutter/material.dart';

import 'dialog_actions.dart';
import 'dialog_title.dart';
import 'pages/page1.dart';
import 'pages/page2.dart';

class MyDialog extends StatefulWidget {
  const MyDialog({super.key});

  @override
  State<StatefulWidget> createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> with TickerProviderStateMixin {
  static const String dialogTitle = "Заголовок";
  static const double dialogMinWidth = 446;
  static const double dialogMinHeight = 671;

  late final Map<String, Widget> _pages = {
    "Вкладка 1": const Page1(),
    "Вкладка 2": const Page2(),
  };

  late final List<Widget> _tabs =
      _pages.keys.map((key) => Tab(text: key)).toList();

  late final List<Widget> _tabViews =
      _pages.values.map((value) => value).toList();

  late final TabController _tabController =
      TabController(length: _pages.length, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: const BoxConstraints.tightFor(
                width: dialogMinWidth,
                height: dialogMinHeight,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const DialogTitle(text: dialogTitle),
                  const Divider(height: 0),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 32, bottom: 32, left: 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TabBar(
                            indicatorColor:
                                Theme.of(context).colorScheme.primary,
                            isScrollable: true,
                            controller: _tabController,
                            tabs: _tabs,
                          ),
                          const Divider(height: 0),
                          const SizedBox(height: 16),
                          Expanded(
                            child: TabBarView(
                              controller: _tabController,
                              children: _tabViews,
                            ),
                          ),
                          const DialogActions(),
                        ],
                      ),
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
