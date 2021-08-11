import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class BlueDivider extends StatelessWidget {
  const BlueDivider({Key? key,required this.width}) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 15,
      color: context.colorScheme.surface,
      endIndent: context.dynamicWidth(width),
    );
  }
}
