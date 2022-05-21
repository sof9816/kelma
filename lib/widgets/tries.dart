import 'package:flutter/material.dart';

class TriesGrid extends StatelessWidget {
  const TriesGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return triesGrid(context);
  }

  Widget triesGrid(context) {
    List<Widget> rows = List.filled(6, triesRow(context));
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: rows),
      ),
    );
  }

  Widget triesRow(context) {
    List<Widget> boxes = triesRowCalculate(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: boxes,
    );
  }

  List<Widget> triesRowCalculate(context) {
    double size = (MediaQuery.of(context).size.width - 70) / 6;
    double borderRadius = size / 6;
    double borderRadiusDouble = borderRadius * 2;
    List<Widget> boxes = [
      letterBox(
          context,
          [borderRadiusDouble, borderRadiusDouble, borderRadius, borderRadius],
          size),
    ];
    boxes.addAll(List.filled(4, letterBox(context, [borderRadius], size)));
    boxes.add(letterBox(
        context,
        [borderRadius, borderRadius, borderRadiusDouble, borderRadiusDouble],
        size));
    return boxes;
  }

  Widget letterBox(context, List<double> radius, size) {
    if (radius.length == 1) {
      radius = List.filled(4, radius[0]);
    }
    return Container(
      margin: const EdgeInsets.fromLTRB(2.5, 4, 2.5, 4),
      height: size,
      width: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius[0]),
            bottomLeft: Radius.circular(radius[1]),
            bottomRight: Radius.circular(radius[2]),
            topRight: Radius.circular(radius[3])),
      ),
      child: Text(
        "",
        style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 30),
      ),
    );
  }
}
