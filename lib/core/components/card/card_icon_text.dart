import '../row/row_icon_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CardIconText extends StatelessWidget {
  const CardIconText({Key? key, required this.cardColor, required this.text, required this.icon}) : super(key: key);

  final Color cardColor;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      elevation: 0,
      child: Padding(
        padding: context.paddingLow,
        child: RowIconText(
          icon: icon,
          text: text,
          color: context.colorScheme.onSurface,
        ),
      ),
    );
  }
}
