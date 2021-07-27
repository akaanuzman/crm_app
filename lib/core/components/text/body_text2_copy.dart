import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class BodyText2Copy extends StatelessWidget {
  const BodyText2Copy({Key? key, required this.data, this.color,this.fontWeight}) : super(key: key);

  final String data;
  final Color? color;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: context.textTheme.bodyText2!.copyWith(color: color,fontWeight: fontWeight),
    );
  }
}
