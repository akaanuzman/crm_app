// ignore_for_file: prefer_const_constructors

import 'package:crm_app/core/init/theme/light/color_scheme_light.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../../../core/components/text/body_text1_copy.dart';
import '../../../../../core/components/text/body_text2_copy.dart';
import '../../model/contact_model.dart';

class ContactUsersDetailView extends StatelessWidget {
  final Users? user;
  const ContactUsersDetailView({Key? key, this.user}) : super(key: key);

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
          height: context.dynamicHeight(0.67),
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
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(user?.photo ??
                              "http://192.168.3.53/assets/images/users/user0.jpg"),
                          radius: 50,
                        ),
                        context.emptySizedWidthBoxLow,
                        Expanded(
                          child: ListTile(
                            title: BodyText1Copy(data: user?.full_name ?? ""),
                            subtitle: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.business,
                                        color: ColorSchemeLight
                                            .instance.piegonPost),
                                    context.emptySizedWidthBoxLow,
                                    Text(
                                      user?.company ?? "",
                                      style: context.textTheme.caption!
                                          .copyWith(
                                              color: ColorSchemeLight
                                                  .instance.piegonPost,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                context.emptySizedHeightBoxLow,
                                Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Görüntüleyebilir",
                                        style: TextStyle(
                                            color:
                                                ColorSchemeLight.instance.java),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        primary: ColorSchemeLight
                                            .instance.hummingBird,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: context.lowBorderRadius,
                                        ),
                                      ),
                                    ),
                                    context.emptySizedWidthBoxLow,
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Icon(
                                        Icons.more_horiz,
                                        color: context.colorScheme.background,
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        primary:
                                            ColorSchemeLight.instance.amour,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: context.lowBorderRadius,
                                        ),
                                      ),
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
                        Center(
                          child: Container(
                            width: double.infinity,
                            height: context.dynamicHeight(0.05),
                            padding: context.paddingLow,
                            decoration: BoxDecoration(
                                color: context.colorScheme.secondary,
                                borderRadius: context.lowBorderRadius),
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 5,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Icon(
                                  Icons.account_circle,
                                ),
                                BodyText2Copy(
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
                              fontWeight: FontWeight.bold,
                            ),
                            Text(user?.detail ?? ""),
                          ],
                        ),
                        context.emptySizedHeightBoxLow3x,
                        Row(
                          children: [
                            BodyText2Copy(
                              data: "DOĞUM TARİHİ : ",
                              fontWeight: FontWeight.bold,
                            ),
                            Text(user?.birthday ?? ""),
                          ],
                        ),
                        context.emptySizedHeightBoxLow3x,
                        Row(
                          children: [
                            BodyText2Copy(
                              data: "FİRMA : ",
                              fontWeight: FontWeight.bold,
                            ),
                            Text(user?.company ?? ""),
                          ],
                        ),
                        context.emptySizedHeightBoxLow3x,
                        Row(
                          children: [
                            BodyText2Copy(
                              data: "MESLEK : ",
                              fontWeight: FontWeight.bold,
                            ),
                            Text(user?.job ?? ""),
                          ],
                        ),
                        context.emptySizedHeightBoxLow3x,
                        Row(
                          children: [
                            BodyText2Copy(
                              data: "EPOSTA : ",
                              fontWeight: FontWeight.bold,
                            ),
                            Text(user?.email ?? ""),
                          ],
                        ),
                        context.emptySizedHeightBoxLow3x,
                        Row(
                          children: [
                            BodyText2Copy(
                              data: "TELEFON : ",
                              fontWeight: FontWeight.bold,
                            ),
                            Text(user?.telephone ?? ""),
                          ],
                        ),
                        context.emptySizedHeightBoxLow,
                        Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "MESAJ GÖNDER",
                              style: TextStyle(
                                  color: ColorSchemeLight.instance.java,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: ColorSchemeLight.instance.hummingBird,
                              shape: RoundedRectangleBorder(
                                borderRadius: context.lowBorderRadius,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
