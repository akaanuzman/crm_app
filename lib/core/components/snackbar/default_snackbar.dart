import '../text/body_text2_copy.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class DefaultSnackBar extends StatelessWidget {
  const DefaultSnackBar({Key? key, required this.data}) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      backgroundColor: context.colorScheme.secondaryVariant,
      content: BodyText2Copy(
        data: data,
        color: context.colorScheme.onSurface,
      ),
    );
  }
}
