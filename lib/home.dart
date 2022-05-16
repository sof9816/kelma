import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String letters =
      "ض0ص0ث0ق0ف0غ0ع0ه0خ0ح0ج0ش0س0ي0ب0ل0ا0ت0ن0م0ك0ة0ء0ظ0ط0ذ0د0ز0ر0و0ى";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Center(
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 250,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(13.0),
                      topRight: Radius.circular(13.0)),
                ),
                child: GridView.builder(
                    padding: const EdgeInsets.fromLTRB(20, 50, 20, 50),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
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
                          child: letterWidget(index, letters),
                          decoration: BoxDecoration(
                              color: getColor(index),
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
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

  Widget letterWidget(index, letters) {
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
