import '../send_mail/view/send_mail_view.dart';

import '../viewmodel/mail_view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/components/text/body_text1_copy.dart';

import '../../../core/components/text/body_text2_copy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kartal/kartal.dart';

class MailView extends StatelessWidget {
  final String content;
  final MailViewModel _viewModel = MailViewModel();

  MailView({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime time = DateTime.now();
    final DateTime today = DateTime(time.year, time.month, time.day);

    MediaQueryData mediaQuery = MediaQuery.of(context);

    double height = mediaQuery.size.height;

    double radius = height * 0.02;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          Expanded(
            flex: 7,
            child: Padding(
              padding: context.paddingLow,
              child: ListView.builder(
                itemCount: 15,
                physics: const BouncingScrollPhysics(),
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
                            _showDialog(context, radius);
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
                        shape: RoundedRectangleBorder(
                            borderRadius: context.lowBorderRadius),
                        elevation: 5,
                        child: ListTile(
                          leading: Icon(
                            Icons.star_border_outlined,
                            color: context.colorScheme.primaryVariant,
                          ),
                          title: Text(content),
                          trailing: Text(today.toString().substring(0, 10)),
                          onTap: () {
                            _showModalBottomSheet(context, radius);
                          },
                        ),
                      ),
                    ),
                    context.emptySizedHeightBoxLow,
                  ],
                ),
              ),
            ),
          ),
          context.emptySizedHeightBoxLow,
          Padding(
            padding: context.paddingNormal,
            child: const Text(
              "Projeleri silmek veya düzenlemek için sağa okundu veya okunmadı olarak işaretlemek için sola kaydırın.",
              maxLines: 2,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: context.paddingLow,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SendMailView()));
                },
                child: Text(
                  "Email Gönder",
                  style: TextStyle(color: context.colorScheme.onSurface),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _showModalBottomSheet(context, double radius) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      builder: (BuildContext context) {
        return Observer(
          builder: (_) {
            return AnimatedContainer(
              duration: context.durationNormal,
              padding: context.paddingNormal,
              height: _viewModel.isContainerHeightChange
                  ? context.dynamicHeight(0.4)
                  : context.dynamicHeight(0.82),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  context.emptySizedHeightBoxLow,
                  Center(
                    child: Container(
                      height: context.dynamicWidth(0.03),
                      width: context.dynamicWidth(0.2),
                      decoration: BoxDecoration(
                          borderRadius: context.lowBorderRadius,
                          color: context.colorScheme.background),
                    ),
                  ),
                  context.emptySizedHeightBoxLow3x,
                  Divider(
                    color: context.colorScheme.onBackground,
                    indent: 20,
                    endIndent: 20,
                  ),
                  Padding(
                    padding: context.paddingLow,
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
                                    hintText: "Eposta içeriğini giriniz.",
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
                                  maxLines: 8,
                                ),
                              ],
                            ),
                          ),
                        ),
                  Padding(
                    padding: context.paddingLow,
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

  _showDialog(BuildContext context, double radius) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
              ),
              title: const BodyText1Copy(
                  data: "Kişiyi silmek istediğinizden emin misiniz ?"),
              content:
                  const BodyText2Copy(data: "Kişi kalıcı olarak silinecektir."),
              actions: [
                ElevatedButton(
                  child: Text("Evet",
                      style: TextStyle(color: context.colorScheme.onSurface)),
                  style: ElevatedButton.styleFrom(
                      primary: context.colorScheme.surface),
                  onPressed: () {
                    // setState(() {
                    //   widget._viewModel.deleteItem(index);
                    // });
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: context.colorScheme.secondaryVariant,
                        duration: context.durationSlow,
                        content: BodyText2Copy(
                          data: "Eposta başarıyla silindi !",
                          color: context.colorScheme.onSurface,
                        ),
                      ),
                    );
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: context.colorScheme.secondaryVariant),
                  child: Text(
                    "Hayır",
                    style: TextStyle(color: context.colorScheme.onSurface),
                  ),
                )
              ],
            ));
  }
}
