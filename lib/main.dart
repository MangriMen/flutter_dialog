import 'package:flutter/material.dart';

import 'src/widgets/home_page.dart';
import 'src/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String appTitle = 'Flutter Demo';
  static const String homePageTitle = 'Dialog demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: createTheme(),
      home: const MyHomePage(title: homePageTitle),
    );
  }
}
