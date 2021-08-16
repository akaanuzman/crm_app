import '../../model/contact_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/components/text/body_text1_copy.dart';
import '../../../../core/components/text/body_text2_copy.dart';

class ContactGuidesDetailView extends StatelessWidget {
  final Guides? guides;
  const ContactGuidesDetailView({Key? key, this.guides}) : super(key: key);

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
      body: Padding(
        padding: context.paddingNormal,
        child: SizedBox(
          height: context.dynamicHeight(0.65),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: context.normalBorderRadius),
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: context.paddingNormal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              "http://192.168.3.53/assets/images/users/${guides?.photo}"),
                          radius: 50,
                        ),
                        context.emptySizedWidthBoxLow,
                        Expanded(
                          child: ListTile(
                            title: BodyText1Copy(data: guides?.name ?? ""),
                            subtitle: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.business,
                                        color:
                                            context.colorScheme.onBackground),
                                    context.emptySizedWidthBoxLow,
                                    Text(
                                      guides?.company ?? "",
                                      style: context.textTheme.caption!
                                          .copyWith(
                                              color: context
                                                  .colorScheme.onBackground),
                                    ),
                                  ],
                                ),
                                context.emptySizedHeightBoxLow,
                                Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Düzenle",
                                        style: TextStyle(
                                            color:
                                                context.colorScheme.onSurface),
                                      ),
                                    ),
                                    context.emptySizedWidthBoxLow,
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Ara",
                                        style: TextStyle(
                                            color:
                                                context.colorScheme.onSurface),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          primary: context
                                              .colorScheme.secondaryVariant),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                context.emptySizedHeightBoxLow,
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: context.paddingNormal,
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        // ignore: prefer_const_constructors
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
                                const Icon(Icons.account_circle),
                                const BodyText2Copy(
                                  data: "KİŞİSEL BİLGİLER",
                                  fontWeight: FontWeight.bold,
                                )
                              ],
                            ),
                          ),
                        ),
                        context.emptySizedHeightBoxLow3x,
                        Row(
                          children: [
                            BodyText2Copy(
                              data: "HAKKIMDA : ",
                              color: context.colorScheme.onBackground,
                            ),
                            Text(guides?.detail ?? ""),
                          ],
                        ),
                        context.emptySizedHeightBoxLow3x,
                        Row(
                          children: [
                            BodyText2Copy(
                              data: "DOĞUM TARİHİ : ",
                              color: context.colorScheme.onBackground,
                            ),
                            Text(guides?.birthday ?? ""),
                          ],
                        ),
                        context.emptySizedHeightBoxLow3x,
                        Row(
                          children: [
                            BodyText2Copy(
                              data: "FİRMA : ",
                              color: context.colorScheme.onBackground,
                            ),
                            Text(guides?.company ?? ""),
                          ],
                        ),
                        context.emptySizedHeightBoxLow3x,
                        Row(
                          children: [
                            BodyText2Copy(
                              data: "MESLEK : ",
                              color: context.colorScheme.onBackground,
                            ),
                            Text(guides?.job ?? ""),
                          ],
                        ),
                        context.emptySizedHeightBoxLow3x,
                        Row(
                          children: [
                            BodyText2Copy(
                              data: "EPOSTA : ",
                              color: context.colorScheme.onBackground,
                            ),
                            Text(guides?.email ?? ""),
                          ],
                        ),
                        context.emptySizedHeightBoxLow3x,
                        Row(
                          children: [
                            BodyText2Copy(
                              data: "TELEFON : ",
                              color: context.colorScheme.onBackground,
                            ),
                            Text(guides?.phone ?? ""),
                          ],
                        ),
                        context.emptySizedHeightBoxLow3x,
                      ],
                    ),
                  ),
                ),
                //Expanded(flex: 2, child: Container())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
