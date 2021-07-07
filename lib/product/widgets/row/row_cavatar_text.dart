import 'package:crm_app/core/components/text/body_text2_copy.dart';
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
        BodyText2Copy(
            data: "Ahmet Kaan Uzman", color: context.colorScheme.onSurface)
      ],
    );
  }
}
