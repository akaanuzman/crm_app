import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class RowCircleAvatar extends StatelessWidget {
  //const RowCircleAvatar({Key? key}) : super(key: key);

  final String firstText;
  final String secondText;

  const RowCircleAvatar(
      {Key? key, required this.firstText, required this.secondText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          child: Text(firstText),
        ),
        context.emptySizedWidthBoxLow,
        CircleAvatar(
          child: Text(secondText),
        ),
      ],
    );
  }
}
