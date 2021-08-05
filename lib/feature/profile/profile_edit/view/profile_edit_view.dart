import '../../../../core/components/text/body_text1_copy.dart';
import '../../../../core/components/text/body_text2_copy.dart';
import 'package:evil_icons_flutter/evil_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:geira_icons/geira_icons.dart';
import 'package:kartal/kartal.dart';

class ProfileEditView extends StatelessWidget {
  const ProfileEditView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: context.dynamicHeight(2.1),
          child: Padding(
            padding: context.paddingNormal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                context.emptySizedHeightBoxLow,
                Row(
                  children: [
                    const Icon(
                      Icons.account_circle,
                    ),
                    context.emptySizedWidthBoxLow,
                    const BodyText1Copy(
                      data: "KİŞİSEL BİLGİLER",
                    ),
                  ],
                ),
                context.emptySizedHeightBoxLow3x,
                Padding(
                  padding: context.paddingLow,
                  child: const Text("İsim:"),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Ahmet Kaan Uzman',
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
                  child: const Text("Kullanıcı Adı:"),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'akaanuzman',
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
                  child: const Text("Kısaca Hakkınızda:"),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'detay2',
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
                  maxLines: 6,
                ),
                context.emptySizedHeightBoxLow,
                Padding(
                  padding: context.paddingLow,
                  child: const Text("Konum:"),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Kütahya',
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
                  child: const Text("Telefon:"),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Telefon numarası giriniz.',
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
                  child: const Text("Başlama Tarihi"),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'mm/dd/yy',
                    prefixIcon: IconButton(
                        onPressed: () {
                          showDatePicker(
                            context: context,
                            initialDate: now,
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
                      borderSide:
                          BorderSide(color: context.colorScheme.surface),
                    ),
                  ),
                  cursorColor: context.colorScheme.onSecondary,
                ),
                context.emptySizedHeightBoxLow3x,
                Center(
                  child: Container(
                    width: double.infinity,
                    height: context.dynamicHeight(0.05),
                    padding: context.paddingLow,
                    color: context.colorScheme.onBackground,
                    child: Wrap(
                      // ignore: prefer_const_literals_to_create_immutables
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 5,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Icon(Icons.business),
                        const BodyText2Copy(
                          data: "ŞİRKET BİLGİLERİ",
                          fontWeight: FontWeight.bold,
                        )
                      ],
                    ),
                  ),
                ),
                context.emptySizedHeightBoxLow3x,
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: context.paddingLow,
                          child: const Text("Şirket:"),
                        ),
                        Padding(
                          padding: context.paddingLow,
                          child: const Text("Meslek:"),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Kuvarssoft',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: context.lowBorderRadius,
                                borderSide: BorderSide(
                                    color: context.colorScheme.onBackground),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: context.lowBorderRadius,
                                borderSide: BorderSide(
                                    color: context.colorScheme.surface),
                              ),
                            ),
                            cursorColor: context.colorScheme.onSecondary,
                          ),
                        ),
                        context.emptySizedWidthBoxLow3x,
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'ceng',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: context.lowBorderRadius,
                                borderSide: BorderSide(
                                    color: context.colorScheme.onBackground),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: context.lowBorderRadius,
                                borderSide: BorderSide(
                                    color: context.colorScheme.surface),
                              ),
                            ),
                            cursorColor: context.colorScheme.onSecondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                context.emptySizedHeightBoxLow3x,
                Center(
                  child: Container(
                    width: double.infinity,
                    height: context.dynamicHeight(0.05),
                    padding: context.paddingLow,
                    color: context.colorScheme.onBackground,
                    child: Wrap(
                      // ignore: prefer_const_literals_to_create_immutables
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 5,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Icon(Icons.business),
                        const BodyText2Copy(
                          data: "SOSYAL MEDYA",
                          fontWeight: FontWeight.bold,
                        )
                      ],
                    ),
                  ),
                ),
                context.emptySizedHeightBoxLow3x,
                Padding(
                  padding: context.paddingLow,
                  child: const Text("Facebook"),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Url',
                    prefixIcon: const Icon(EvilIcons.sc_facebook),
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
                  child: const Text("Twitter"),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Url',
                    prefixIcon: const Icon(EvilIcons.sc_twitter),
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
                  child: const Text("Instagram"),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Url',
                    prefixIcon: const Icon(
                      GIcons.instagram,
                      size: 34,
                    ),
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
                  child: const Text("Linkedin"),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Url',
                    prefixIcon: const Icon(
                      EvilIcons.sc_linkedin,
                    ),
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
                  child: const Text("Github"),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Url',
                    prefixIcon: const Icon(EvilIcons.sc_github),
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
                  child: const Text("Kişisel Siteniz"),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Url',
                    prefixIcon: const Icon(Icons.language),
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
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: BodyText2Copy(
                        data: "Kaydet", color: context.colorScheme.onSurface),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
