// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:crm_app/core/components/text/body_text1_copy.dart';
import 'package:crm_app/core/components/text/body_text2_copy.dart';
import 'package:crm_app/core/constants/app/app_constants.dart';
import 'package:crm_app/core/init/theme/light/color_scheme_light.dart';
import 'package:crm_app/feature/home/profile/viewmodel/profile/profile_view_model.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:evil_icons_flutter/evil_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:geira_icons/geira_icons.dart';
import 'package:kartal/kartal.dart';

class ProfileEditView extends StatelessWidget {
  final ProfileViewModel _viewModel = ProfileViewModel();
  String name = "";
  String phone = "";
  String detail = "";
  String location = "";
  String birthDay = "";
  String job = "";
  String webSite = "";
  String instagram = "";
  String linkedIn = "";
  String gitHub = "";
  String twitter = "";
  String facebook = "";
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
                  TextFormField(
                    initialValue: _viewModel.items.full_name,
                    decoration: InputDecoration(
                      filled: true,
                      prefixIcon: const Icon(Icons.person),
                      labelText: 'İsim giriniz.',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: context.lowBorderRadius,
                        borderSide:
                            BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: context.lowBorderRadius,
                        borderSide:
                            BorderSide(color: context.colorScheme.onSecondary),
                      ),
                    ),
                    cursorColor: context.colorScheme.onSecondary,
                    onSaved: (value) => name = value!,
                  ),
                  context.emptySizedHeightBoxLow,
                  Padding(
                    padding: context.paddingLow,
                    child: const Text("Telefon:"),
                  ),
                  context.emptySizedHeightBoxLow,
                  TextFormField(
                    initialValue: _viewModel.items.telephone,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      filled: true,
                      prefixIcon: const Icon(Icons.phone),
                      hintText: _viewModel.items.telephone ??
                          'Telefon numarası giriniz.',
                      labelText: 'Telefon numarası giriniz.',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: context.lowBorderRadius,
                        borderSide:
                            BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: context.lowBorderRadius,
                        borderSide:
                            BorderSide(color: context.colorScheme.surface),
                      ),
                    ),
                    cursorColor: context.colorScheme.onSecondary,
                    onSaved: (value) => phone = value!,
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
                  //           BorderSide(color: Colors.grey),
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
                  TextFormField(
                    initialValue: _viewModel.items.detail,
                    decoration: InputDecoration(
                      filled: true,
                      prefixIcon: const Icon(Icons.description),
                      hintText: _viewModel.items.detail ??
                          "Hakkınzda kısa bilgi giriniz.",
                      labelText: 'Hakkınızda',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: context.lowBorderRadius,
                        borderSide:
                            BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: context.lowBorderRadius,
                        borderSide:
                            BorderSide(color: context.colorScheme.surface),
                      ),
                    ),
                    cursorColor: context.colorScheme.onSecondary,
                    maxLines: 6,
                    onSaved: (value) => detail = value!,
                  ),
                  context.emptySizedHeightBoxLow,
                  Padding(
                    padding: context.paddingLow,
                    child: const Text("Konum:"),
                  ),
                  context.emptySizedHeightBoxLow,
                  TextFormField(
                    initialValue: _viewModel.items.location,
                    decoration: InputDecoration(
                      filled: true,
                      prefixIcon: const Icon(Icons.location_on),
                      hintText: "Konumuzu giriniz.",
                      labelText: 'Konum',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: context.lowBorderRadius,
                        borderSide:
                            BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: context.lowBorderRadius,
                        borderSide:
                            BorderSide(color: context.colorScheme.surface),
                      ),
                    ),
                    cursorColor: context.colorScheme.onSecondary,
                    onSaved: (value) => location = value!,
                  ),
                  context.emptySizedHeightBoxLow,
                  Padding(
                    padding: context.paddingLow,
                    child: const Text("Başlama Tarihi"),
                  ),
                  TextFormField(
                    initialValue: _viewModel.items.birthday,
                    decoration: InputDecoration(
                      filled: true,
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
                            BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: context.lowBorderRadius,
                        borderSide:
                            BorderSide(color: context.colorScheme.surface),
                      ),
                    ),
                    cursorColor: context.colorScheme.onSecondary,
                    onSaved: (value) => birthDay = value!,
                  ),
                  context.emptySizedHeightBoxLow3x,
                  Center(
                    child: Container(
                      width: double.infinity,
                      height: context.dynamicHeight(0.05),
                      padding: context.paddingLow,
                      color: Color(0xffC0C0C0),
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
                            child: TextFormField(
                              initialValue: _viewModel.items.company_name,
                              decoration: InputDecoration(
                                filled: true,
                                prefixIcon: const Icon(Icons.business),
                                hintText: "Şirket ismi giriniz.",
                                labelText: 'Şirket ismi',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: context.lowBorderRadius,
                                  borderSide: BorderSide(
                                      color: Colors.grey),
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
                            child: TextFormField(
                              initialValue: _viewModel.items.job,
                              decoration: InputDecoration(
                                filled: true,
                                prefixIcon: const Icon(Icons.work),
                                hintText: "Meslek giriniz.",
                                labelText: 'Meslek',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: context.lowBorderRadius,
                                  borderSide: BorderSide(
                                      color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: context.lowBorderRadius,
                                  borderSide: BorderSide(
                                      color: context.colorScheme.surface),
                                ),
                              ),
                              cursorColor: context.colorScheme.onSecondary,
                              onSaved: (value) => job = value!,
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
                      color: Color(0xffC0C0C0),
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
                  TextFormField(
                    initialValue: _viewModel.items.web_site,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Url',
                      prefixIcon: const Icon(Icons.language),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: context.lowBorderRadius,
                        borderSide:
                            BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: context.lowBorderRadius,
                        borderSide:
                            BorderSide(color: context.colorScheme.surface),
                      ),
                    ),
                    cursorColor: context.colorScheme.onSecondary,
                    onSaved: (value) => webSite = value!,

                  ),
                  context.emptySizedHeightBoxLow,
                  Padding(
                    padding: context.paddingLow,
                    child: const Text("Instagram"),
                  ),
                  TextFormField(
                    initialValue: _viewModel.items.instagram,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Url',
                      prefixIcon: const Icon(
                        GIcons.instagram,
                        size: 34,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: context.lowBorderRadius,
                        borderSide:
                            BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: context.lowBorderRadius,
                        borderSide:
                            BorderSide(color: context.colorScheme.surface),
                      ),
                    ),
                    cursorColor: context.colorScheme.onSecondary,
                    onSaved: (value) => instagram = value!,

                  ),
                  context.emptySizedHeightBoxLow,
                  Padding(
                    padding: context.paddingLow,
                    child: const Text("Linkedin"),
                  ),
                  TextFormField(
                    initialValue: _viewModel.items.linkedin,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Url',
                      prefixIcon: const Icon(
                        EvilIcons.sc_linkedin,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: context.lowBorderRadius,
                        borderSide:
                            BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: context.lowBorderRadius,
                        borderSide:
                            BorderSide(color: context.colorScheme.surface),
                      ),
                    ),
                    cursorColor: context.colorScheme.onSecondary,
                    onSaved: (value) => linkedIn = value!,

                  ),
                  context.emptySizedHeightBoxLow,
                  Padding(
                    padding: context.paddingLow,
                    child: const Text("Github"),
                  ),
                  TextFormField(
                    initialValue: _viewModel.items.github,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Url',
                      prefixIcon: const Icon(EvilIcons.sc_github),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: context.lowBorderRadius,
                        borderSide:
                            BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: context.lowBorderRadius,
                        borderSide:
                            BorderSide(color: context.colorScheme.surface),
                      ),
                    ),
                    cursorColor: context.colorScheme.onSecondary,
                    onSaved: (value) => gitHub = value!,

                  ),
                  context.emptySizedHeightBoxLow,
                  Padding(
                    padding: context.paddingLow,
                    child: const Text("Twitter"),
                  ),
                  TextFormField(
                    initialValue: _viewModel.items.twitter,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Url',
                      prefixIcon: const Icon(EvilIcons.sc_twitter),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: context.lowBorderRadius,
                        borderSide:
                            BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: context.lowBorderRadius,
                        borderSide:
                            BorderSide(color: context.colorScheme.surface),
                      ),
                    ),
                    cursorColor: context.colorScheme.onSecondary,
                    onSaved: (value) => twitter = value!,

                  ),
                  context.emptySizedHeightBoxLow,
                  Padding(
                    padding: context.paddingLow,
                    child: const Text("Facebook"),
                  ),
                  TextFormField(
                    initialValue: _viewModel.items.facebook,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Url',
                      prefixIcon: const Icon(EvilIcons.sc_facebook),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: context.lowBorderRadius,
                        borderSide:
                            BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: context.lowBorderRadius,
                        borderSide:
                            BorderSide(color: context.colorScheme.surface),
                      ),
                    ),
                    cursorColor: context.colorScheme.onSecondary,
                    onSaved:  (value) => facebook = value!,

                  ),
                  context.emptySizedHeightBoxLow,

                  Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width: context.dynamicWidth(0.25),
                      child: ElevatedButton(
                        onPressed: () async {
                          debugPrint(name);
                          // String token = ApplicationConstants.instance!.token;
                          // Dio dio = Dio();
                          // await dio.post(
                          //     "http://192.168.3.53/api/Persons/update_my_profile?token=$token&full_name=${nameController.text}&telephone=${phoneController.text}&detail=${detailController.text}&company_id=1&job=${jobController.text}&birthday=${birthDayController.text}&web_site=${webSiteController.text}&location=${locationController.text}&instagram=${instagramController.text}&linkedin=${linkedInController.text}&github=${gitHubController.text}&twitter=${twitterController.text}&facebook=${facebookController.text}");
                          // _viewModel.fetchItems(token, "");
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   SnackBar(
                          //     backgroundColor:
                          //         context.colorScheme.secondaryVariant,
                          //     duration: context.durationSlow,
                          //     content: BodyText2Copy(
                          //       data: "Profil bilgileri başarıyla güncellendi !",
                          //       color: context.colorScheme.onSurface,
                          //     ),
                          //   ),
                          // );
                        },
                        child: Row(
                          children: [
                            Icon(Icons.save,color: ColorSchemeLight.instance.java),
                            context.emptySizedHeightBoxLow3x,
                            BodyText2Copy(
                                data: "Kaydet", color: ColorSchemeLight.instance.java),
                          ],

                        ),
                        style: ElevatedButton.styleFrom(
                          primary: ColorSchemeLight.instance.hummingBird)
                      ),
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
