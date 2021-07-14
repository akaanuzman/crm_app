import 'package:crm_app/core/components/text/body_text1_copy.dart';
import 'package:crm_app/core/components/text/body_text2_copy.dart';
import 'package:crm_app/core/components/textfield/search_text_field.dart';
import 'package:crm_app/product/widgets/dismissible/delete_dismissible.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class MyFriendsView extends StatelessWidget {
  const MyFriendsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.fromLTRB(context.lowValue, context.normalValue,
          context.lowValue, context.lowValue),
      child: Column(
        children: [
          Expanded(child: SearchTextField()),
          context.emptySizedHeightBoxLow,
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: BodyText1Copy(
                      data: "Kişi Ekle", color: context.colorScheme.onSurface),
                  style: ElevatedButton.styleFrom(
                      primary: context.colorScheme.primaryVariant),
                ),
              ),
            ),
          ),
          context.emptySizedHeightBoxLow,
          Expanded(
            flex: 9,
            child: ListView.builder(
              // ignore: prefer_const_constructors
              itemBuilder: (context, index) => DeleteDismissible(
                child: Card(
                  child: ListTile(
                    onTap: () {},
                    title: const BodyText2Copy(data: "test arkadaş"),
                    subtitle: Text(
                      "test_arkadas@hotmail.com",
                      style: context.textTheme.button,
                    ),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
