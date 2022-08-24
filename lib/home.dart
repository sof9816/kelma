import 'package:flutter/material.dart';
import 'package:kelma/widgets/keyboard.dart';
import 'package:kelma/widgets/tries.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  KeyboardController controller = KeyboardController();
  TriesController triesController = TriesController();
  List<String> letters = List<String>.filled(30, "");
  var letterIndex = 0;

  @override
  void initState() {
    super.initState();
    controller.typeAction = (letter) {
      typeLetter(letter);
    };
    controller.removeAction = () {
      removeLetter();
    };
    controller.enterAction = () {};
  }

  removeLetter() {
    if (letterIndex > 0) letterIndex--;
    setState(() {
      letters[letterIndex] = "";
    });
  }

  typeLetter(String letter) {
    setState(() {
      letters[letterIndex] = letter;
    });
    if (letterIndex < letters.length - 1) letterIndex++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            color: const Color(0xFFD9D9D9),
            child: Column(
              children: [
                Expanded(
                  child: TriesGrid(letters: letters),
                ),
                Keyboard(controller: controller),
              ],
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
