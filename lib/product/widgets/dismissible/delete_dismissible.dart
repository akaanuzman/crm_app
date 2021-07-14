import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class DeleteDismissible<T> extends StatelessWidget {
  final Widget child;

  const DeleteDismissible({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      child: child,
      background: _buildSwipeActionRight(context),
      direction: DismissDirection.endToStart,
    );
  }

  Widget _buildSwipeActionRight(BuildContext context) => Container(
        alignment: Alignment.centerRight,
        padding: context.horizontalPaddingNormal,
        color: context.colorScheme.primaryVariant,
        child: Icon(
          Icons.delete_forever,
          color: context.colorScheme.onSurface,
          size: context.dynamicWidth(0.08),
        ),
      );
}
