
import '../divider/blue_divider.dart';
import 'package:flutter/material.dart';

class BlueBar extends StatelessWidget {
  const BlueBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const Divider(
          thickness: 15,
        ),
        const BlueDivider()
      ],
    );
  }
}
