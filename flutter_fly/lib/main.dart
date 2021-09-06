import 'package:flutter/material.dart';
import 'package:flutter_fly/theme.dart';
import 'package:flutter_fly/welcome/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub API',
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      // themeMode: ThemeMode.dark,
      // themeMode: ThemeMode.light,
      themeMode: ThemeMode.system,
      home: WelcomeScreen(),
    );
  }
}
