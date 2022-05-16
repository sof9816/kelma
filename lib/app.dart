import 'package:flutter/material.dart';
import 'package:kelma/home.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kalemat',
      theme: ThemeData(
        buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
        textTheme: const TextTheme(
          bodyText1: TextStyle(
              fontFamily: "SF Arabic",
              fontSize: 22,
              color: Colors.white,
              debugLabel: "Regular",
              fontWeight: FontWeight.w400),
          headline1: TextStyle(
              fontFamily: "IBMPlexSansArabic",
              fontSize: 36,
              color: Colors.black,
              debugLabel: "Bold",
              fontWeight: FontWeight.w700),
          headline2: TextStyle(
              fontFamily: "IBMPlexSansArabic",
              fontSize: 24,
              color: Color(0xFFD9D9D9),
              debugLabel: "Medium",
              fontWeight: FontWeight.w300),
          headline3: TextStyle(
              fontFamily: "IBMPlexSansArabic",
              fontSize: 14,
              color: Color(0xFFD9D9D9),
              debugLabel: "Light",
              fontWeight: FontWeight.w300),
        ),
      ),
      home: const Home(),
    );
  }
}
