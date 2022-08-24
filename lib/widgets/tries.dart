import 'package:flutter/material.dart';
import 'package:kelma/utils/constants.dart';

class TriesGrid extends StatefulWidget {
  final List<String> letters;
  TriesGrid({Key? key, required this.letters}) : super(key: key);

  @override
  State<TriesGrid> createState() => _TriesGridState();
}

class _TriesGridState extends State<TriesGrid> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return triesGrid(context);
  }

  Widget triesGrid(context) {
    return GridView.builder(
        padding: const EdgeInsets.fromLTRB(50, 25, 50, 0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
        ),
        itemCount: widget.letters.length,
        itemBuilder: (BuildContext context, int index) {
          var letter = widget.letters[index];
          return letterBox(context, letter);
        });
  }

  Widget letterBox(context, String letter) {
    return Container(
      margin: const EdgeInsets.fromLTRB(2.5, 4, 2.5, 4),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Color(0xFFF6F6F6),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Text(
        letter,
        style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 30),
      ),
    );
  }
}

typedef TriesAction = Function(String value);

class TriesController {
  TriesAction? triesAction;

  void dispose() {
    triesAction = null;
  }
}
