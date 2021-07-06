import 'package:flutter/material.dart';

class DefaultSwitchListTile extends StatelessWidget {
  const DefaultSwitchListTile(
      {Key? key, required this.value, this.onChanged, required this.child})
      : super(key: key);
  final bool value;
  final Function(bool)? onChanged;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
        value: value,
        onChanged: (value) {
          onChanged;
        },
        title: child);
  }
}
