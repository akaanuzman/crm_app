import 'package:crm_app/core/components/text/body_text1_copy.dart';
import 'package:crm_app/core/components/text/body_text2_copy.dart';
import 'package:crm_app/core/components/textfield/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kartal/kartal.dart';

class ContactModel extends StatelessWidget {
  final String name;
  final String email;

  const ContactModel({Key? key, required this.name, required this.email})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(context.lowValue, context.normalValue,
            context.lowValue, context.lowValue),
        child: Column(
          children: [
            const Expanded(flex: 2, child: SearchTextField()),
            context.emptySizedHeightBoxLow,
            Expanded(
              flex: 2,
              child: SizedBox(
                width: double.infinity,
                child: Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: BodyText1Copy(
                        data: "Kişi Ekle",
                        color: context.colorScheme.onSurface),
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
                itemBuilder: (context, index) => Slidable(
                  actionPane: const SlidableDrawerActionPane(),
                  actions: [
                    IconSlideAction(
                      color: context.colorScheme.primaryVariant,
                      caption: 'Sil',
                      icon: Icons.delete,
                      onTap: () {
                        // setState(() {
                        //   widget._viewModel.deleteItem(index);
                        // });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor:
                                context.colorScheme.secondaryVariant,
                            duration: context.durationSlow,
                            content: BodyText2Copy(
                              data: "Kişi başarıyla silindi !",
                              color: context.colorScheme.onSurface,
                            ),
                          ),
                        );
                      },
                    ),
                    IconSlideAction(
                      color: context.colorScheme.onPrimary,
                      foregroundColor: context.colorScheme.onSurface,
                      caption: 'Düzenle',
                      icon: Icons.edit,
                      onTap: () {
                        _showModalBottomSheet(context);
                      },
                    ),
                  ],
                  child: Card(
                    child: ListTile(
                      onTap: () {},
                      title: BodyText2Copy(data: name),
                      subtitle: Text(
                        email,
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
      ),
    );
  }

  _showModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: context.dynamicHeight(0.4),
            padding: context.paddingNormal,
            decoration: BoxDecoration(
              color: context.colorScheme.onSurface,
              borderRadius: BorderRadius.only(
                topLeft: context.highadius,
                topRight: context.highadius,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: context.paddingLow,
                  child: const Text("Kişi"),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Kişinin ismi',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: context.lowBorderRadius,
                      borderSide:
                          BorderSide(color: context.colorScheme.onBackground),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: context.lowBorderRadius,
                      borderSide:
                          BorderSide(color: context.colorScheme.surface),
                    ),
                  ),
                  cursorColor: context.colorScheme.onSecondary,
                ),
                context.emptySizedHeightBoxLow,
                Padding(
                  padding: context.paddingLow,
                  child: const Text("Email"),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Kişinin emaili',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: context.lowBorderRadius,
                      borderSide:
                          BorderSide(color: context.colorScheme.onBackground),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: context.lowBorderRadius,
                      borderSide:
                          BorderSide(color: context.colorScheme.surface),
                    ),
                  ),
                  cursorColor: context.colorScheme.onSecondary,
                ),
                context.emptySizedHeightBoxLow3x,
                Divider(
                  color: context.colorScheme.secondaryVariant,
                  thickness: 0.4,
                ),
                Center(
                  child: TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Icon(Icons.save),
                          context.emptySizedWidthBoxLow,
                          const BodyText2Copy(
                            data: "Kaydet",
                          ),
                        ],
                      )),
                ),
              ],
            ),
          );
        });
  }
}
