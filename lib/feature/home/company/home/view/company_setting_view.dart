// ignore_for_file: prefer_const_constructors

import 'package:crm_app/core/components/text/body_text2_copy.dart';
import 'package:crm_app/core/components/text/subtitle1_copy.dart';
import 'package:crm_app/core/init/theme/light/color_scheme_light.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CompanySettingView extends StatelessWidget {
  const CompanySettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.paddingLow,
        child: Column(
          children: [
            SizedBox(
              height: context.dynamicHeight(0.1),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: context.lowBorderRadius),
                child: ListTile(
                  title: BodyText2Copy(
                    data: "School Calendar",
                    fontWeight: FontWeight.bold,
                  ),
                  subtitle: Subtitle1Copy(
                    data: "Events & Happenings",
                    color: Colors.grey,
                  ),
                  trailing: SizedBox(
                    width: context.dynamicWidth(0.3),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Icon(Icons.add, color: context.colorScheme.onSurface),
                          Text(
                            "Add Event",
                            style:
                                TextStyle(color: context.colorScheme.onSurface),
                          )
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: ColorSchemeLight.instance.java,
                        shadowColor: ColorSchemeLight.instance.hummingBird,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
