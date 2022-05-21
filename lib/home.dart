import 'package:flutter/material.dart';
import 'package:kelma/widgets/keyboard.dart';
import 'package:kelma/widgets/tries.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Center(
        child: Container(
          color: const Color(0xFFD9D9D9),
          child: Stack(
            children: const [
              Positioned(top: 150, left: 0, right: 0, child: TriesGrid()),
              Positioned(bottom: 0, left: 0, right: 0, child: Keyboard()),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
