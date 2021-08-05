import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class BlueDivider extends StatelessWidget {
  const BlueDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 15,
      color: context.colorScheme.surface,
      endIndent: context.dynamicWidth(0.1),
    );
  }
}
