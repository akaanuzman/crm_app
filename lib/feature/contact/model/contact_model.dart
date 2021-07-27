import 'package:popup_card/popup_card.dart';

import '../contact_detail/view/contact_detail_view.dart';

import '../../../core/components/text/body_text1_copy.dart';
import '../../../core/components/text/body_text2_copy.dart';
import '../../../core/components/textfield/search_text_field.dart';
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
      appBar: AppBar(
        title: Text(
          "Kişileriniz",
          style: TextStyle(color: context.colorScheme.onSecondary),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      floatingActionButton: PopupItemLauncher(
        tag: 'Proje Ekle',
        child: Material(
          color: context.colorScheme.primaryVariant,
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: context.highBorderRadius),
          child: Icon(
            Icons.add_rounded,
            size: 48,
            color: context.colorScheme.onSurface,
          ),
        ),
        popUp: PopUpItem(
          padding: EdgeInsets.zero,
          color: context.colorScheme.onSurface,
          shape:
              RoundedRectangleBorder(borderRadius: context.normalBorderRadius),
          elevation: 2,
          tag: 'Proje Ekle',
          child: const PopUpItemBody(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      body: Padding(
        padding: context.paddingLow,
        child: Column(
          children: [
            const Expanded(flex: 2, child: SearchTextField()),
            context.emptySizedHeightBoxLow,
            Expanded(
              flex: 10,
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
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ContactDetailView()));
                      },
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

class PopUpItemBody extends StatelessWidget {
  const PopUpItemBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: context.paddingNormal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                  padding: context.paddingLow,
                  child: const BodyText1Copy(data: "Kişi Ekle")),
            ),
            Padding(
              padding: context.paddingLow,
              child: const Text("İsim"),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'İsim giriniz.(En az 3 karakter)',
                enabledBorder: OutlineInputBorder(
                  borderRadius: context.lowBorderRadius,
                  borderSide:
                      BorderSide(color: context.colorScheme.onBackground),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: context.lowBorderRadius,
                  borderSide: BorderSide(color: context.colorScheme.surface),
                ),
              ),
              cursorColor: context.colorScheme.onSecondary,
            ),
            context.emptySizedHeightBoxLow,
            Padding(
              padding: context.paddingLow,
              child: const Text("Eposta"),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Eposta giriniz.',
                enabledBorder: OutlineInputBorder(
                  borderRadius: context.lowBorderRadius,
                  borderSide:
                      BorderSide(color: context.colorScheme.onBackground),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: context.lowBorderRadius,
                  borderSide: BorderSide(color: context.colorScheme.surface),
                ),
              ),
              cursorColor: context.colorScheme.onSecondary,
            ),
            context.emptySizedHeightBoxLow,
            Padding(
              padding: context.paddingLow,
              child: const Text("Telefon"),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Telefon giriniz.',
                enabledBorder: OutlineInputBorder(
                  borderRadius: context.lowBorderRadius,
                  borderSide:
                      BorderSide(color: context.colorScheme.onBackground),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: context.lowBorderRadius,
                  borderSide: BorderSide(color: context.colorScheme.surface),
                ),
              ),
              cursorColor: context.colorScheme.onSecondary,
            ),
            Padding(
              padding: context.paddingLow,
              child: const Text("Hakkında"),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Hakkında giriniz.',
                enabledBorder: OutlineInputBorder(
                  borderRadius: context.lowBorderRadius,
                  borderSide:
                      BorderSide(color: context.colorScheme.onBackground),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: context.lowBorderRadius,
                  borderSide: BorderSide(color: context.colorScheme.surface),
                ),
              ),
              cursorColor: context.colorScheme.onSecondary,
              maxLines: 2,
            ),
                        Padding(
              padding: context.paddingLow,
              child: const Text("Meslek"),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Meslek giriniz.',
                enabledBorder: OutlineInputBorder(
                  borderRadius: context.lowBorderRadius,
                  borderSide:
                      BorderSide(color: context.colorScheme.onBackground),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: context.lowBorderRadius,
                  borderSide: BorderSide(color: context.colorScheme.surface),
                ),
              ),
              cursorColor: context.colorScheme.onSecondary,
            ),
            context.emptySizedHeightBoxLow,
            context.emptySizedHeightBoxLow,
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
                      const Icon(Icons.add),
                      context.emptySizedWidthBoxLow,
                      const BodyText2Copy(
                        data: "Ekle",
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
