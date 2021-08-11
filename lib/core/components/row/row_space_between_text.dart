import 'package:flutter/material.dart';

class RowSpaceBetweenText extends StatelessWidget {
  //const RowSpaceBetweenText({Key? key}) : super(key: key);
  final String firstText;
  final String secondText;
  final String thirthText;

  const RowSpaceBetweenText(
      {Key? key, required this.firstText, required this.secondText,required this.thirthText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Text(
          firstText,
        ),
        Text(
          "$secondText/$thirthText",
        ),
      ],
    );
  }
}
