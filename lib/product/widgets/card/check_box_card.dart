import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/constants/app/app_constants.dart';

class CheckBoxCard extends StatefulWidget {
  final bool isSelect;
  final String data;
  final String? guiId;
  final String? userId;
  final Widget? child;

  const CheckBoxCard(
      {Key? key,
      required this.isSelect,
      required this.data,
      this.guiId,
      this.userId,
      this.child})
      : super(key: key);

  @override
  _CheckBoxCardState createState() => _CheckBoxCardState();
}

class _CheckBoxCardState extends State<CheckBoxCard> {
  bool isSelected = false;
  String guiId = "";
  String userId = "";

  @override
  void initState() {
    super.initState();
    isSelected = widget.isSelect;
    guiId = widget.guiId ?? "0";
    userId = widget.userId ?? "0";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: isSelected ? Colors.green[100] : context.colorScheme.secondary,
          elevation: 5,
          child: Column(
            children: [
              CheckboxListTile(
                value: isSelected,
                onChanged: (value) {
                  setState(() => isSelected = value!);

                  if (isSelected) {
                    ApplicationConstants.instance!.guiId.add(guiId);
                    ApplicationConstants.instance!.userId.add(userId);
                  } else {
                    ApplicationConstants.instance!.guiId.remove(guiId);
                    ApplicationConstants.instance!.userId.remove(userId);
                  }
                },
                title: Text(widget.data),
                secondary: const Icon(Icons.person),
                activeColor: context.colorScheme.onPrimary,
              ),
              isSelected
                  ? widget.child ?? context.emptySizedHeightBoxLow
                  : context.emptySizedHeightBoxLow,
            ],
          ),
        ),
        context.emptySizedHeightBoxLow,
      ],
    );
  }
}
