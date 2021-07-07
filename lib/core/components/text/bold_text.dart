import 'package:flutter/material.dart';

class BoldText extends StatelessWidget {
  const BoldText({Key? key, required this.data}) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }
}
