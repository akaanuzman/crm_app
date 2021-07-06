import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class RowCavatarText extends StatelessWidget {
  const RowCavatarText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const CircleAvatar(
          child: Text("AK"),
        ),
        context.emptySizedWidthBoxLow3x,
        Text(
          "Ahmet Kaan Uzman",
          style: context.textTheme.bodyText2,
        ),
      ],
    );
  }
}
