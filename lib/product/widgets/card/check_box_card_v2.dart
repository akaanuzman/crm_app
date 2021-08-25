// ignore_for_file: prefer_const_constructors

import 'package:crm_app/core/constants/app/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CheckBoxCardV2 extends StatefulWidget {
  final bool isSelect;
  final String data;
  final String userId;
  const CheckBoxCardV2(
      {Key? key,
      required this.isSelect,
      required this.data,
      required this.userId})
      : super(key: key);

  @override
  _CheckBoxCardState createState() => _CheckBoxCardState();
}

class _CheckBoxCardState extends State<CheckBoxCardV2> {
  bool isSelected = false;
  String userId = "";
  String dropdownValue = '1';

  @override
  void initState() {
    super.initState();
    isSelected = widget.isSelect;
    userId = widget.userId;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: isSelected ? Colors.green[100] : context.colorScheme.secondary,
          elevation: 5,
          child: CheckboxListTile(
            value: isSelected,
            onChanged: (value) {
              setState(() => isSelected = value!);
              if (isSelected) {
                ApplicationConstants.instance!.userId.add(userId);
              } else {
                ApplicationConstants.instance!.userId.remove(userId);
              }
            },
            title: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 15,
              children: [
                Text("Erişim seviyesi"),
                DropdownButton<String>(
                  value: dropdownValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      ApplicationConstants.instance!.accessLevel.add(dropdownValue);
                    });
                  },
                  items: <String>['1', '2', '3']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            secondary: SizedBox(
              width: context.dynamicWidth(0.4),
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Icon(Icons.person),
                  context.emptySizedWidthBoxLow3x,
                  Text(widget.data)
                ],
              ),
            ),
            activeColor: context.colorScheme.onPrimary,
          ),
        ),
        context.emptySizedHeightBoxLow,
      ],
    );
  }
}
