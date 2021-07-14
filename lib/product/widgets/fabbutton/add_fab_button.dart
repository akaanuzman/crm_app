import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class AddFabButton extends StatelessWidget {
  const AddFabButton({ Key? key, required this.tooltip }) : super(key: key);

  final String tooltip;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: context.verticalPaddingMedium,
        child: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.add,
            color: context.colorScheme.onSurface,
          ),
          backgroundColor: context.colorScheme.onPrimary,
          elevation: 0,
          tooltip: tooltip,
        ),
      );
  }
}