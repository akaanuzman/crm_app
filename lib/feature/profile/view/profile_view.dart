import '../../../core/components/text/body_text1_copy.dart';
import '../../../core/components/text/body_text2_copy.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

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
        body: SingleChildScrollView(
          child: SizedBox(
            height: context.dynamicHeight(1.85),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: context.paddingLow,
                    child: Card(
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
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
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
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
                                    primary:
                                        context.colorScheme.primaryVariant),
                              ),
                            ],
                          ),
                          context.emptySizedHeightBoxLow,
                          Padding(
                            padding: context.paddingNormal,
                            child: Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("HAKKIMDA:"),
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
                              // ignore: prefer_const_literals_to_create_immutables
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
                              // ignore: prefer_const_literals_to_create_immutables
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
                              // ignore: prefer_const_literals_to_create_immutables
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
                          ),                Padding(
                            padding: context.paddingNormal,
                            child: Row(
                              // ignore: prefer_const_literals_to_create_immutables
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
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                  color: Colors.amberAccent,
                )),
                Expanded(
                    child: Container(
                  color: Colors.blue,
                )),
                Expanded(
                    child: Container(
                  color: Colors.green,
                )),
                Expanded(
                    child: Container(
                  color: Colors.red,
                )),
              ],
            ),
          ),
        ));
  }
}
