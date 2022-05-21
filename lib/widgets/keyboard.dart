import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({Key? key}) : super(key: key);

  final String letters =
      "ض0ص0ث0ق0ف0غ0ع0ه0خ0ح0ج0ش0س0ي0ب0ل0ا0ت0ن0م0ك0ة0ء0ظ0ط0ذ0د0ز0ر0و0ى";

  @override
  Widget build(BuildContext context) {
    return keyboardGrid(context);
  }

  Widget keyboardGrid(context) {
    double height = (MediaQuery.of(context).size.height / 4) + 20;
    return Stack(
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
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 26,
                  mainAxisExtent: 42,
                  childAspectRatio: 26 / 42,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 12),
              itemCount: letters.split("0").length + 2,
              itemBuilder: (BuildContext ctx, index) {
                return GestureDetector(
                  onTap: () {
                    int newIndex = index + 1;
                    int count = letters.split("0").length;
                    if (newIndex == 23 || newIndex == count + 2) {
                      return;
                    }
                  },
                  child: Container(
                    width: 29,
                    height: 42,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: getColor(index),
                        borderRadius: BorderRadius.circular(15)),
                    child: letterWidget(context, index, letters),
                  ),
                );
              }),
        ),
        Positioned(bottom: 40, left: 5, child: enterButton()),
        Positioned(bottom: 40, right: 5, child: removeButton())
      ],
    );
  }

  Color getColor(index) {
    int newIndex = index + 1;
    int count = letters.split("0").length;
    if (newIndex == 23 || newIndex == count + 2) {
      return Colors.black;
    } else {
      return const Color.fromARGB(89, 217, 217, 217);
    }
  }

  Widget enterButton() {
    return Container(
      width: 41,
      height: 42,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: const Color.fromARGB(89, 217, 217, 217),
          borderRadius: BorderRadius.circular(22)),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.keyboard_return_outlined,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget removeButton() {
    return Container(
      width: 41,
      height: 42,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: const Color.fromARGB(89, 217, 217, 217),
          borderRadius: BorderRadius.circular(22)),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.backspace_outlined,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget letterWidget(context, index, letters) {
    int count = letters.split("0").length;
    int newIndex = index + 1;
    if (newIndex == 23) {
      return const Text("");
    }
    if (newIndex == count + 2) {
      return const Text("");
    }
    if (newIndex > 23 && newIndex < count + 2) {
      return Text(
        letters.split("0")[index - 1],
        style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
      );
    }
    String letter = letters.split("0")[index];
    return Text(
      letter,
      style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
    );
  }
}
