import 'package:flutter/material.dart';

import '../divider/blue_divider.dart';

class BlueBar extends StatelessWidget {
  const BlueBar({Key? key, required this.width}) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Stack(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const Divider(
          thickness: 15,
        ),
        BlueDivider(width: width)
      ],
    );
  }
}
