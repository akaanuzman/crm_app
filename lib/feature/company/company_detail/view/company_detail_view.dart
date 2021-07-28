import 'package:crm_app/core/components/text/body_text1_copy.dart';
import 'package:crm_app/core/components/text/body_text2_copy.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:popup_card/popup_card.dart';

class CompanyDetailView extends StatelessWidget {
  const CompanyDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.network(
          "http://192.168.3.53/assets/images/logo-light.png",
          width: context.dynamicWidth(0.28),
        ),
        centerTitle: true,
      ),
      floatingActionButton: PopupItemLauncher(
        tag: 'Proje Ekle',
        child: Material(
          color: context.colorScheme.surface,
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: context.highBorderRadius),
          child: Icon(
            Icons.more_vert,
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
      body: SingleChildScrollView(
        child: SizedBox(
          height: context.dynamicHeight(1.85),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: context.paddingNormal,
                child: Text(
                  "Kuvarssoft",
                  style: context.textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.colorScheme.onSecondary),
                ),
              ),
              Expanded(
                  // ignore: prefer_const_constructors
                  child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: context.paddingLow,
                      child: Card(
                        child: Padding(
                          padding: context.paddingNormal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                radius: 40,
                                child: Icon(
                                  Icons.person,
                                  size: context.dynamicWidth(0.1),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  BodyText1Copy(
                                    data: "15",
                                    color: context.colorScheme.onSecondary,
                                  ),
                                  context.emptySizedHeightBoxLow,
                                  const BodyText2Copy(data: "Çalışan Sayısı"),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
              Expanded(
                  // ignore: prefer_const_constructors
                  child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: context.paddingLow,
                      child: Card(
                        child: Padding(
                          padding: context.paddingNormal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                radius: 40,
                                child: Icon(
                                  Icons.call,
                                  size: context.dynamicWidth(0.1),
                                ),
                                backgroundColor: context.colorScheme.error,
                                foregroundColor: context.colorScheme.onSurface,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  BodyText1Copy(
                                    data: "555 555 55 55",
                                    color: context.colorScheme.onSecondary,
                                  ),
                                  context.emptySizedHeightBoxLow,
                                  const BodyText2Copy(data: "Telefon"),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
              Expanded(
                  // ignore: prefer_const_constructors
                  child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: context.paddingLow,
                      child: Card(
                        child: Padding(
                          padding: context.paddingNormal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                radius: 40,
                                child: Icon(
                                  Icons.event,
                                  size: context.dynamicWidth(0.1),
                                ),
                                backgroundColor: context.colorScheme.onPrimary,
                                foregroundColor: context.colorScheme.onSurface,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  BodyText1Copy(
                                    data: "bişeyler.com",
                                    color: context.colorScheme.onSecondary,
                                  ),
                                  context.emptySizedHeightBoxLow,
                                  const BodyText2Copy(data: "Web Site"),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
              Expanded(
                  // ignore: prefer_const_constructors
                  child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: context.paddingLow,
                      child: Card(
                        child: Padding(
                          padding: context.paddingNormal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                radius: 40,
                                child: Icon(
                                  Icons.email,
                                  size: context.dynamicWidth(0.1),
                                ),
                                backgroundColor:
                                    context.colorScheme.primaryVariant,
                                foregroundColor: context.colorScheme.onSurface,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  BodyText1Copy(
                                    data: "falan@gmail.com",
                                    color: context.colorScheme.onSecondary,
                                  ),
                                  context.emptySizedHeightBoxLow,
                                  const BodyText2Copy(data: "Eposta:"),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
              context.emptySizedHeightBoxLow3x,
              Expanded(
                  flex: 4,
                  child: Padding(
                    padding: context.paddingLow,
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: context.paddingNormal,
                            child: Text(
                              "Çalışanlar",
                              style: context.textTheme.headline4!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: context.colorScheme.onSecondary),
                            ),
                          ),
                          Expanded(
                              child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) => ExpansionTile(
                              // ignore: prefer_const_constructors
                              title: BodyText1Copy(data: "Ahmet Kaan Uzman"),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("uzmanakan@gmail.com"),
                                  context.emptySizedWidthBoxLow3x,
                                  const Text("555 555 55 55"),
                                ],
                              ),
                              leading: const CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "http://192.168.3.53/assets/images/users/user0.jpg"),
                              ),
                              expandedAlignment: Alignment.centerLeft,
                              children: [
                                context.emptySizedHeightBoxLow3x,
                                Padding(
                                  padding: context.horizontalPaddingNormal,
                                  child: Row(
                                    children: [
                                      Text(
                                        "Konum",
                                        style: TextStyle(
                                            color:
                                                context.colorScheme.onBackground),
                                      ),
                                      context.emptySizedWidthBoxLow3x,
                                      const Text("Kütahya"),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  thickness: 2,
                                  indent: 15,
                                  endIndent: 15,
                                ),
                                Padding(
                                  padding: context.horizontalPaddingNormal,
                                  child: Row(
                                    children: [
                                      Text(
                                        "Doğum Tarihi",
                                        style: TextStyle(
                                            color:
                                                context.colorScheme.onBackground),
                                      ),
                                      context.emptySizedWidthBoxLow3x,
                                      const Text("2001-12-25"),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  thickness: 2,
                                  indent: 15,
                                  endIndent: 15,
                                ),
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  )),
              context.emptySizedHeightBoxLow3x,
              Expanded(
                flex: 4,
                child: Padding(
                  padding: context.paddingLow,
                  child: Card(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: context.paddingNormal,
                              child: Text(
                                "Bilgiler",
                                style: context.textTheme.headline4!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: context.colorScheme.onSecondary),
                              ),
                            ),
                            const Icon(Icons.more_vert)
                          ],
                        ),
                        const CircleAvatar(
                          radius: 64,
                          backgroundImage: NetworkImage(
                              "http://192.168.3.53/assets/images/logo-sm.png"),
                        ),
                        context.emptySizedHeightBoxLow3x,
                        Padding(
                          padding: context.horizontalPaddingNormal,
                          child: Row(
                            children: [
                              Text(
                                "Email",
                                style: TextStyle(
                                    color: context.colorScheme.onBackground),
                              ),
                              context.emptySizedWidthBoxLow3x,
                              const Text("test@gmail.com"),
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 2,
                          indent: 15,
                          endIndent: 15,
                        ),
                        Padding(
                          padding: context.horizontalPaddingNormal,
                          child: Row(
                            children: [
                              Text(
                                "Telefon",
                                style: TextStyle(
                                    color: context.colorScheme.onBackground),
                              ),
                              context.emptySizedWidthBoxLow3x,
                              const Text("555 555 55 55"),
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 2,
                          indent: 15,
                          endIndent: 15,
                        ),
                        Padding(
                          padding: context.horizontalPaddingNormal,
                          child: Row(
                            children: [
                              Text(
                                "Vergi Dairesi",
                                style: TextStyle(
                                    color: context.colorScheme.onBackground),
                              ),
                              context.emptySizedWidthBoxLow3x,
                              const Text("Kütahya Vergi Dairesi"),
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 2,
                          indent: 15,
                          endIndent: 15,
                        ),
                        Padding(
                          padding: context.horizontalPaddingNormal,
                          child: Row(
                            children: [
                              Text(
                                "Vergi Numarası",
                                style: TextStyle(
                                    color: context.colorScheme.onBackground),
                              ),
                              context.emptySizedWidthBoxLow3x,
                              const Text("123456"),
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 2,
                          indent: 15,
                          endIndent: 15,
                        ),
                        Padding(
                          padding: context.horizontalPaddingNormal,
                          child: Row(
                            children: [
                              Text(
                                "Konum",
                                style: TextStyle(
                                    color: context.colorScheme.onBackground),
                              ),
                              context.emptySizedWidthBoxLow3x,
                              const Text("Kütahya/Türkiye"),
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 2,
                          indent: 15,
                          endIndent: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: CircleAvatar(
                  backgroundColor: context.colorScheme.primaryVariant,
                  child: Icon(
                    Icons.close,
                    color: context.colorScheme.onSurface,
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                  padding: context.paddingLow,
                  child:
                      const BodyText1Copy(data: "Firma Ayrıntıları Düzenle")),
            ),
            Padding(
              padding: context.paddingLow,
              child: const Text("Erişim İsmi"),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Erisim ismi giriniz.',
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
              child: const Text("Firma İsmi"),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Firma ismi giriniz.',
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
              child: const Text("Web Site"),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Web site giriniz.',
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
            context.emptySizedHeightBoxLow,
            Padding(
              padding: context.paddingLow,
              child: const Text("Konum"),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Konum giriniz.',
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
                hintText: 'Detay giriniz.',
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
              child: const Text("Vergi Numarası"),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Vergi numarası giriniz.',
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
              child: const Text("Vergi Dairesi"),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Vergi Dairesi giriniz.',
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
