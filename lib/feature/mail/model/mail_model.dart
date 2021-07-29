import '../viewmodel/mail_view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/components/text/body_text1_copy.dart';

import '../../../core/components/text/body_text2_copy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kartal/kartal.dart';

class MailModel extends StatelessWidget {
  final String content;
  final MailViewModel _viewModel = MailViewModel();

  MailModel({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime time = DateTime.now();
    final DateTime today = DateTime(time.year, time.month, time.day);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Gelen Kutusu",
          style: TextStyle(color: context.colorScheme.onSecondary),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          context.emptySizedHeightBoxLow,
          Expanded(
            flex: 7,
            child: ListView.builder(
              itemBuilder: (context, index) => Column(
                children: [
                  Slidable(
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
                                data: "Mail başarıyla silindi !",
                                color: context.colorScheme.onSurface,
                              ),
                            ),
                          );
                        },
                      ),
                      IconSlideAction(
                          color: context.colorScheme.error,
                          foregroundColor: context.colorScheme.onSurface,
                          caption: 'Ertele',
                          icon: Icons.alarm,
                          onTap: () {}),
                    ],
                    secondaryActions: [
                      IconSlideAction(
                        color: context.colorScheme.surface,
                        foregroundColor: context.colorScheme.onSurface,
                        caption: 'Okundu',
                        icon: Icons.mark_email_read,
                        onTap: () {},
                      ),
                      IconSlideAction(
                        color: context.colorScheme.secondaryVariant,
                        foregroundColor: context.colorScheme.onSurface,
                        caption: 'Okunmadı',
                        icon: Icons.mark_email_unread,
                        onTap: () {},
                      ),
                    ],
                    child: Card(
                      child: ListTile(
                        leading: const Icon(Icons.star_border_outlined),
                        title: Text(content),
                        trailing: Text(today.toString().substring(0, 10)),
                        onTap: () {
                          _showModalBottomSheet(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          context.emptySizedHeightBoxLow3x,
          Padding(
            padding: context.paddingNormal,
            child: const Text(
              "Projeleri silmek veya düzenlemek için sağa okundu veya okunmadı olarak işaretlemek için sola kaydırın.",
              maxLines: 2,
            ),
          )
        ],
      ),
    );
  }

  _showModalBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Observer(
          builder: (_) {
            return AnimatedContainer(
              duration: context.durationSlow,
              height: _viewModel.isContainerHeightChange
                  ? context.dynamicHeight(0.3)
                  : context.dynamicHeight(0.6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  context.emptySizedHeightBoxLow,
                  Divider(
                    color: context.colorScheme.onBackground,
                    indent: 20,
                    endIndent: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        // ignore: prefer_const_constructors
                        CircleAvatar(
                          // ignore: prefer_const_constructors
                          backgroundImage: NetworkImage(
                              "http://192.168.3.53/assets/images/users/user0.jpg"),
                          radius: 30,
                        ),
                        context.emptySizedWidthBoxLow,
                        // ignore: prefer_const_constructors
                        Expanded(
                          // ignore: prefer_const_constructors
                          child: ListTile(
                            title: const BodyText1Copy(data: "Deneme Mail"),
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BodyText2Copy(
                                    data: "Kimden Geldi: ",
                                    color: context.colorScheme.onBackground),
                                BodyText2Copy(
                                    data: "test@hotmail.com",
                                    color: context.colorScheme.onBackground),
                                context.emptySizedHeightBoxLow,
                              ],
                            ),
                            trailing: const Text("2021-07-14 08:19:36"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  context.emptySizedHeightBoxLow,
                  Padding(
                    padding: context.horizontalPaddingNormal,
                    child: const Text("mesaj içeriği"),
                  ),
                  context.emptySizedHeightBoxLow,
                  Divider(
                    color: context.colorScheme.onBackground,
                    indent: 20,
                    endIndent: 20,
                  ),
                  _viewModel.isContainerHeightChange
                      ? context.emptySizedWidthBoxLow
                      : Expanded(
                          child: Padding(
                            padding: context.paddingLow,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: context.paddingLow,
                                  child: const Text("Başlık"),
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Epostanızın başlığını giriniz.',
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: context.lowBorderRadius,
                                      borderSide: BorderSide(
                                          color:
                                              context.colorScheme.onBackground),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: context.lowBorderRadius,
                                      borderSide: BorderSide(
                                          color: context.colorScheme.surface),
                                    ),
                                  ),
                                  cursorColor: context.colorScheme.onSecondary,
                                ),
                                context.emptySizedHeightBoxLow,
                                Padding(
                                  padding: context.paddingLow,
                                  child: const Text("İçerik"),
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: context.lowBorderRadius,
                                      borderSide: BorderSide(
                                          color:
                                              context.colorScheme.onBackground),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: context.lowBorderRadius,
                                      borderSide: BorderSide(
                                          color: context.colorScheme.surface),
                                    ),
                                  ),
                                  cursorColor: context.colorScheme.onSecondary,
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ),
                        ),
                  Padding(
                    padding: context.horizontalPaddingLow,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        _viewModel.isContainerHeightChange
                            ? context.emptySizedHeightBoxLow
                            : ElevatedButton(
                                onPressed: () {},
                                child: const BodyText2Copy(data: "Kaydet"),
                                style: ElevatedButton.styleFrom(
                                    primary:
                                        context.colorScheme.primaryVariant),
                              ),
                        context.emptySizedWidthBoxLow,
                        ElevatedButton(
                          onPressed: () {
                            _viewModel.changeContainerHeight();
                          },
                          child: const BodyText2Copy(data: "Yanıtla"),
                        ),
                        context.emptySizedWidthBoxLow,
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const BodyText2Copy(data: "Vazgeç"),
                          style: ElevatedButton.styleFrom(
                              primary: context.colorScheme.surface),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
