import 'package:flutter/material.dart';

@immutable
class Keyboard extends StatelessWidget {
  KeyboardController? controller;
  Keyboard({Key? key, this.controller}) : super(key: key);

  final String letters =
      "ض0ص0ث0ق0ف0غ0ع0ه0خ0ح0ج0ش0س0ي0ب0ل0ا0ت0ن0م0ك0ة0ظ0ط0ذ0د0ز0ر0و0ى";

  @override
  Widget build(BuildContext context) {
    return keyboardGrid(context);
  }

  Widget keyboardGrid(context) {
    double height = (MediaQuery.of(context).size.height / 4) + 20;
    var lettersArray = letters.split("0");
    return Column(
      children: [
        Container(
          height: height,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(height / 15),
                topRight: Radius.circular(height / 15)),
          ),
          child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(10, 15, 15, 0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 10,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
              ),
              itemCount: lettersArray.length,
              itemBuilder: (BuildContext ctx, index) {
                var letter = lettersArray[index];
                if (letter.isEmpty) return const SizedBox();
                return Material(
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(89, 217, 217, 217),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.all(0),
                        ),
                      ),
                      onPressed: () {
                        if (controller?.typeAction != null) {
                          controller?.typeAction!(letter);
                        }
                      },
                      child: Text(
                        letter,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 20),
                      ),
                    ),
                  ),
                );
              }),
        ),
        Container(
          color: Colors.black,
          child: Row(
            children: [
              enterButton(),
              removeButton(),
            ],
          ),
        )
      ],
    );
  }

  Widget enterButton() {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
          height: 40,
          decoration: BoxDecoration(
              color: const Color.fromARGB(89, 217, 217, 217),
              borderRadius: BorderRadius.circular(22)),
          child: IconButton(
            onPressed: () {
              if (controller?.enterAction != null) {
                controller?.enterAction!();
              }
            },
            icon: const Icon(
              Icons.keyboard_return_outlined,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget removeButton() {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
          height: 40,
          decoration: BoxDecoration(
              color: const Color.fromARGB(89, 217, 217, 217),
              borderRadius: BorderRadius.circular(22)),
          child: IconButton(
            onPressed: () {
              if (controller?.removeAction != null) {
                controller?.removeAction!();
              }
            },
            icon: const Icon(
              Icons.backspace_outlined,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class KeyboardController {
  Function(String value)? typeAction;
  Function()? removeAction;
  Function()? enterAction;

  void dispose() {
    typeAction = null;
    removeAction = null;
    enterAction = null;
  }
}
