// ignore_for_file: must_be_immutable

import 'package:crm_app/core/components/text/body_text1_copy.dart';
import 'package:crm_app/core/components/text/body_text2_copy.dart';
import 'package:crm_app/core/constants/app/app_constants.dart';
import 'package:crm_app/feature/home/profile/viewmodel/profile/profile_view_model.dart';
import 'package:dio/dio.dart';


import 'package:flutter_mobx/flutter_mobx.dart';


import 'package:evil_icons_flutter/evil_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:geira_icons/geira_icons.dart';
import 'package:kartal/kartal.dart';

class ProfileEditView extends StatelessWidget {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var detailController = TextEditingController();
  var jobController = TextEditingController();
  var birthDayController = TextEditingController();
  var webSiteController = TextEditingController();
  var locationController = TextEditingController();
  var instagramController = TextEditingController();
  var linkedInController = TextEditingController();
  var gitHubController = TextEditingController();
  var twitterController = TextEditingController();
  var facebookController = TextEditingController();
  final ProfileViewModel _viewModel = ProfileViewModel();
  ProfileEditView({Key? key}) : super(key: key) {
    _viewModel.fetchItems(ApplicationConstants.instance!.token, "");
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return Scaffold(
      body: Observer(
        builder: (context) => SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
                  context.emptySizedHeightBoxLow,
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      labelText: 'İsim giriniz.',
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
                  context.emptySizedHeightBoxLow,
                  TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.phone),
                      hintText: _viewModel.items.telephone ??
                          'Telefon numarası giriniz.',
                      labelText: 'Telefon numarası giriniz.',
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
                  // Padding(
                  //   padding: context.paddingLow,
                  //   child: const Text("Kullanıcı Adı:"),
                  // ),
                  // TextField(
                  //   decoration: InputDecoration(
                  //     hintText: _viewModel.items.user_name ??
                  //         "Kullanıcı adı giriniz.",
                  //     enabledBorder: OutlineInputBorder(
                  //       borderRadius: context.lowBorderRadius,
                  //       borderSide:
                  //           BorderSide(color: context.colorScheme.onBackground),
                  //     ),
                  //     focusedBorder: OutlineInputBorder(
                  //       borderRadius: context.lowBorderRadius,
                  //       borderSide:
                  //           BorderSide(color: context.colorScheme.surface),
                  //     ),
                  //   ),
                  //   cursorColor: context.colorScheme.onSecondary,
                  // ),
                  // context.emptySizedHeightBoxLow,
                  Padding(
                    padding: context.paddingLow,
                    child: const Text("Kısaca Hakkınızda:"),
                  ),
                  context.emptySizedHeightBoxLow,
                  TextField(
                    controller: detailController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.description),
                      hintText: _viewModel.items.detail ??
                          "Hakkınzda kısa bilgi giriniz.",
                      labelText: 'Hakkınızda',
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
                  context.emptySizedHeightBoxLow,
                  TextField(
                    controller: locationController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.location_on),
                      hintText:
                          _viewModel.items.location ?? "Konumuzu giriniz.",
                      labelText: 'Konum',
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
                    controller: birthDayController,
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
                      context.emptySizedHeightBoxLow,
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.business),
                                hintText: _viewModel.items.company_name ??
                                    "Şirket ismi giriniz.",
                                labelText: 'Şirket ismi',
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
                              controller: jobController,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.work),
                                hintText:
                                    _viewModel.items.job ?? "Meslek giriniz.",
                                labelText: 'Meslek',
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
                          const Icon(Icons.public),
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
                    child: const Text("Kişisel Siteniz"),
                  ),
                  TextField(
                    controller: webSiteController,
                    decoration: InputDecoration(
                      hintText: _viewModel.items.web_site ?? 'Url',
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
                  Padding(
                    padding: context.paddingLow,
                    child: const Text("Instagram"),
                  ),
                  TextField(
                    controller: instagramController,
                    decoration: InputDecoration(
                      hintText: _viewModel.items.instagram ?? 'Url',
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
                    controller: linkedInController,
                    decoration: InputDecoration(
                      hintText: _viewModel.items.linkedin ?? 'Url',
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
                    controller: gitHubController,
                    decoration: InputDecoration(
                      hintText: _viewModel.items.github ?? 'Url',
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
                    child: const Text("Twitter"),
                  ),
                  TextField(
                    controller: twitterController,
                    decoration: InputDecoration(
                      hintText: _viewModel.items.twitter ?? 'Url',
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
                    child: const Text("Facebook"),
                  ),
                  TextField(
                    controller: facebookController,
                    decoration: InputDecoration(
                      hintText: _viewModel.items.facebook ?? 'Url',
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

                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () async {
                        String token = ApplicationConstants.instance!.token;
                        Dio dio = Dio();
                        await dio.post(
                            "http://192.168.3.53/api/Persons/update_my_profile?token=$token&full_name=${nameController.text}&telephone=${phoneController.text}&detail=${detailController.text}&company_id=1&job=${jobController.text}&birthday=${birthDayController.text}&web_site=${webSiteController.text}&location=${locationController.text}&instagram=${instagramController.text}&linkedin=${linkedInController.text}&github=${gitHubController.text}&twitter=${twitterController.text}&facebook=${facebookController.text}");
                        _viewModel.fetchItems(token, "");
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor:
                                context.colorScheme.secondaryVariant,
                            duration: context.durationSlow,
                            content: BodyText2Copy(
                              data: "Profil bilgileri başarıyla güncellendi !",
                              color: context.colorScheme.onSurface,
                            ),
                          ),
                        );
                      },
                      child: BodyText2Copy(
                          data: "Kaydet", color: context.colorScheme.onSurface),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
