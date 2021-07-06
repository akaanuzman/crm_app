import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class RowFlagText extends StatelessWidget {
  const RowFlagText({Key? key, required this.url, required this.text})
      : super(key: key);

  final String url;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          url,
          width: 24,
        ),
        context.emptySizedWidthBoxLow3x,
        Text(
          text,
        ),
      ],
    );
  }
}
