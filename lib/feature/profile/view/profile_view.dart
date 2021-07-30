// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:crm_app/core/components/text/bold_text.dart';
import 'package:crm_app/core/components/text/subtitle1_copy.dart';
import 'package:evil_icons_flutter/evil_icons_flutter.dart';
import 'package:flutter/painting.dart';
import 'package:geira_icons/geira_icons.dart';

import '../../../core/components/text/body_text1_copy.dart';
import '../../../core/components/text/body_text2_copy.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    double height = mediaQuery.size.height;

    double radius = height * 0.02;

    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        height: context.dynamicHeight(1.85),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: context.paddingLow,
                child: Card(
                  elevation: 3,
                  child: Column(
                    children: [
                      context.emptySizedHeightBoxLow,
                      const CircleAvatar(
                        radius: 45,
                        child: Text("AK"),
                      ),
                      context.emptySizedHeightBoxLow,
                      const BodyText1Copy(data: "Ahmet Kaan Uzman"),
                      const Text("@akaanuzman"),
                      context.emptySizedHeightBoxLow,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: BodyText2Copy(
                                data: "Follow",
                                color: context.colorScheme.onSurface),
                          ),
                          context.emptySizedWidthBoxLow,
                          ElevatedButton(
                            onPressed: () {},
                            child: BodyText2Copy(
                                data: "Message",
                                color: context.colorScheme.onSurface),
                            style: ElevatedButton.styleFrom(
                                primary: context.colorScheme.primaryVariant),
                          ),
                        ],
                      ),
                      context.emptySizedHeightBoxLow,
                      Padding(
                        padding: context.paddingNormal,
                        child: Row(
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: BoldText(data: "HAKKIMDA: "),
                            ),
                            context.emptySizedWidthBoxLow,
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text("detay2"),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: context.paddingNormal,
                        child: Row(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Tam isim:",
                                style: TextStyle(
                                    color: context.colorScheme.onBackground,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            context.emptySizedWidthBoxLow,
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Ahmet Kaan Uzman"),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: context.paddingNormal,
                        child: Row(
                          // ignore:
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Telefon :",
                                style: TextStyle(
                                    color: context.colorScheme.onBackground,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            context.emptySizedWidthBoxLow,
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text("+90 111 111 11 11"),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: context.paddingNormal,
                        child: Row(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Eposta :",
                                style: TextStyle(
                                    color: context.colorScheme.onBackground,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            context.emptySizedWidthBoxLow,
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text("uzmanakan@gmail.com"),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: context.paddingNormal,
                        child: Row(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Konum :",
                                style: TextStyle(
                                    color: context.colorScheme.onBackground,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            context.emptySizedWidthBoxLow,
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Kütahya/Türkiye"),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: context.paddingNormal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              child: Icon(
                                GIcons.instagram,
                                size: 48,
                                color: context.colorScheme.onSurface,
                              ),
                              backgroundColor: Color(0xff9935B4),
                            ),
                            CircleAvatar(
                              radius: 30,
                              child: Icon(
                                EvilIcons.sc_github,
                                size: 48,
                                color: context.colorScheme.onSurface,
                              ),
                              backgroundColor:
                                  context.colorScheme.secondaryVariant,
                            ),
                            CircleAvatar(
                              radius: 30,
                              child: Icon(
                                EvilIcons.sc_linkedin,
                                size: 48,
                                color: context.colorScheme.onSurface,
                              ),
                              backgroundColor: Color(0xff0A66C2),
                            ),
                            CircleAvatar(
                              radius: 30,
                              child: Icon(
                                EvilIcons.sc_twitter,
                                size: 48,
                                color: context.colorScheme.onSurface,
                              ),
                              backgroundColor: Color(0xff1DA1F2),
                            ),
                            CircleAvatar(
                              radius: 30,
                              child: Icon(
                                EvilIcons.sc_facebook,
                                size: 48,
                                color: context.colorScheme.onSurface,
                              ),
                              backgroundColor: Color(0xff17A8FD),
                            ),
                            CircleAvatar(
                              radius: 30,
                              child: Icon(
                                Icons.language,
                                size: 48,
                                color: context.colorScheme.onSurface,
                              ),
                              backgroundColor: context.colorScheme.onPrimary,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: context.paddingLow,
                child: Card(
                  elevation: 3,
                  child: Padding(
                    padding: context.paddingNormal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.work),
                            context.emptySizedWidthBoxLow,
                            BodyText1Copy(data: "DENEYİMLERİM"),
                          ],
                        ),
                        context.emptySizedHeightBoxLow3x,
                        Expanded(
                          child: ListView.builder(
                            itemCount: 5,
                            itemBuilder: (context, index) => Column(
                              children: [
                                ListTile(
                                  leading: Icon(Icons.info),
                                  title: BodyText2Copy(
                                    data: "test baslik",
                                    fontWeight: FontWeight.bold,
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Subtitle1Copy(data: "test alt baslik"),
                                      Subtitle1Copy(data: "test aciklama"),
                                    ],
                                  ),
                                  trailing: Text("2021-07-15"),
                                ),
                                context.emptySizedHeightBoxLow,
                                Divider(
                                  color: context.colorScheme.onBackground,
                                  indent: 15,
                                  endIndent: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _showModalBottomSheet(context, radius);
                          },
                          child: Text(
                            "Deneyim Ekle",
                            style:
                                TextStyle(color: context.colorScheme.onSurface),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: context.colorScheme.onError),
                        ),
                        context.emptySizedHeightBoxLow3x,
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.task_alt),
                                  context.emptySizedWidthBoxLow,
                                  BodyText1Copy(data: "PROJELERİM"),
                                ],
                              ),
                              context.emptySizedHeightBoxLow3x,
                              Expanded(
                                child: ListView.builder(
                                  itemCount: 5,
                                  itemBuilder: (context, index) => Column(
                                    children: [
                                      ListTile(
                                        leading: Icon(Icons.event),
                                        title: BodyText2Copy(
                                          data: "Proje İsmi",
                                          fontWeight: FontWeight.bold,
                                        ),
                                        subtitle:
                                            Subtitle1Copy(data: "proje detayi"),
                                        trailing: Text("Ahmet Kaan Uzman"),
                                      ),
                                      Divider(
                                        color: context.colorScheme.onBackground,
                                        indent: 15,
                                        endIndent: 15,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  _showModalBottomSheet(context, double radius) {
    DateTime _now = DateTime.now();

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      builder: (BuildContext context) {
        return Container(
          height: context.dynamicHeight(0.75),
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
              Padding(
                padding: context.paddingLow,
                child: const Text("Başlık"),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Örn: Bilgisayar Mühendisi',
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
                child: const Text("Şirket-Okul Adı"),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Örn: Kuvarssoft',
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
                child: const Text("Tarih"),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'mm/dd/yy',
                  prefixIcon: IconButton(
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          initialDate: _now,
                          firstDate: DateTime(DateTime.now().year - 5),
                          lastDate: DateTime(DateTime.now().year + 5),
                        );
                      },
                      icon: const Icon(Icons.calendar_today)),
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
                child: const Text("Detay"),
              ),
              TextField(
                decoration: InputDecoration(
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
                maxLines: 3,
              ),
              context.emptySizedHeightBoxLow3x,
              Divider(
                color: context.colorScheme.onBackground,
              ),
              Padding(
                padding: context.paddingLow,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: BodyText2Copy(
                          data: "Vazgeç", color: context.colorScheme.onSurface),
                      style: ElevatedButton.styleFrom(
                          primary: context.colorScheme.secondaryVariant),
                    ),
                    context.emptySizedWidthBoxLow,
                    ElevatedButton(
                      onPressed: () {},
                      child: BodyText2Copy(
                          data: "Ekle", color: context.colorScheme.onSurface),
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
  }
}
