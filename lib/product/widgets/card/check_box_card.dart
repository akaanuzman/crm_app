import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CheckBoxCard extends StatefulWidget {
  final bool isSelect;
  final String data;
  const CheckBoxCard({Key? key, required this.isSelect, required this.data}) : super(key: key);

  @override
  _CheckBoxCardState createState() => _CheckBoxCardState();
}

class _CheckBoxCardState extends State<CheckBoxCard> {
  bool isSelected = false;
  @override
  void initState() {
    super.initState();
    isSelected = widget.isSelect;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: isSelected ? Colors.green[100] : null,
          elevation: 5,
          child: CheckboxListTile(
            value: isSelected,
            onChanged: (value) {
              setState(() {
                isSelected = value!;
              });
            },
            title: Text(widget.data),
            secondary: const Icon(Icons.person),
            activeColor: context.colorScheme.onPrimary,
          ),
        ),
        context.emptySizedHeightBoxLow,
      ],
    );
  }
}
