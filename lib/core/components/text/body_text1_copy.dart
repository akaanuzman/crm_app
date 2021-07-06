import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class BodyText1Copy extends StatelessWidget {
  const BodyText1Copy({Key? key, required this.data, this.color})
      : super(key: key);

  final String data;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: context.textTheme.bodyText1!.copyWith(color: color),
    );
  }
}
