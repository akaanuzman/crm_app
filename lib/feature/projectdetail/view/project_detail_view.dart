import 'package:crm_app/core/components/text/body_text1_copy.dart';
import 'package:crm_app/core/components/text/body_text2_copy.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ProjecetDetailView extends StatelessWidget {
  const ProjecetDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);

    return Scaffold(
      appBar: AppBar(
        title: Image.network(
          "http://192.168.3.53/assets/images/logo-light.png",
          width: context.dynamicWidth(0.28),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: context.paddingLow,
        child: Column(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Yeni Görev Ekle",
                  style: context.textTheme.bodyText1!
                      .copyWith(color: context.colorScheme.onSurface),
                ),
              ),
            ),
            context.emptySizedHeightBoxLow,
            Expanded(
              flex: 6,
              child: PageView(
                scrollDirection: Axis.vertical,
                children: [
                  Card(
                    child: ListTile(
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          context.emptySizedHeightBoxLow,
                          Text("Proje 1", style: context.textTheme.headline3),
                          context.emptySizedHeightBoxLow,
                          const BodyText1Copy(data: "Proje Hakkında: "),
                          context.emptySizedHeightBoxLow,
                          const Text("2021-06-0300123"),
                          context.emptySizedHeightBoxNormal,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const BodyText2Copy(
                                data: "Başlanma\n   Tarihi",
                              ),
                              const BodyText2Copy(
                                  data: "Tamamlanma\n       Tarihi"),
                              const BodyText2Copy(data: "Anlaşılan\n    Fiyat")
                            ],
                          ),
                          context.emptySizedHeightBoxLow,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text("2021-06-03"),
                              const Text("2021-07-06"),
                              const Text("\$15,800")
                            ],
                          ),
                          context.emptySizedHeightBoxLow3x,
                          const BodyText2Copy(data: "Erişim Sahipleri--"),
                          context.emptySizedHeightBoxLow,
                          Row(
                            children: [
                              const CircleAvatar(
                                child: Text("AA"),
                              ),
                              context.emptySizedWidthBoxLow,
                              const CircleAvatar(
                                child: Text("AA"),
                              ),
                              context.emptySizedWidthBoxLow,
                              const CircleAvatar(
                                child: Text("AA"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                        title: Text(
                          "Kalan Görevler",
                          style: context.textTheme.headline3,
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            context.emptySizedHeightBoxLow,
                            SizedBox(
                              width: context.dynamicWidth(0.35),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Text("1"),
                                  const Text("%25"),
                                  const Text("4")
                                ],
                              ),
                            ),
                            Stack(
                              children: [
                                Divider(
                                  thickness: 15,
                                  endIndent: context.dynamicWidth(0.5),
                                ),
                                Divider(
                                  thickness: 15,
                                  endIndent: context.dynamicWidth(0.8),
                                  color: context.colorScheme.surface,
                                ),
                              ],
                            ),
                            context.emptySizedHeightBoxLow,
                            Text("Tamamlanan / Toplam Görev"),
                            context.emptySizedHeightBoxLow,
                            Expanded(
                              child: ListView.builder(
                                itemBuilder: (context, index) => Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      child: Text("Proje 1 Görev ${index + 1}",style: context.textTheme.headline4,),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.red),
                                      ),
                                    ),
                                    context.emptySizedHeightBoxLow3x
                                  ],
                                ),
                              ),
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
            context.emptySizedHeightBoxLow,
            Padding(
              padding: context.horizontalPaddingLow,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Görevler",
                      style: context.textTheme.headline4!
                          .copyWith(fontWeight: FontWeight.bold))),
            ),
            context.emptySizedHeightBoxLow,
            Expanded(
              flex: 6,
              child: PageView(
                children: [
                  ListView.builder(
                    itemBuilder: (context, index) => Card(
                      child: ListTile(
                        title: BodyText2Copy(
                          data: "Proje 1 Görev ${index + 1}",
                        ),
                        trailing: SizedBox(
                          height: context.dynamicHeight(0.1),
                          width: context.dynamicWidth(0.225),
                          child: Row(
                            children: [
                              const Icon(Icons.calendar_today),
                              context.emptySizedWidthBoxLow,
                              Text("${date.day}/${date.month}/${date.year}")
                            ],
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.red,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
