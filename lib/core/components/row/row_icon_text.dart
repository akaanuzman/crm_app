import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class RowIconText extends StatelessWidget {
  const RowIconText(
      {Key? key, required this.icon, required this.text, this.color})
      : super(key: key);

  final IconData icon;
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: color ?? context.colorScheme.secondaryVariant,
        ),
        context.emptySizedWidthBoxLow3x,
        Text(
          text,
          style: TextStyle(color: color),
        ),
      ],
    );
  }
}
