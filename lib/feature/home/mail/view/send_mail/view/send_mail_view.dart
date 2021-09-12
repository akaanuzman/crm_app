// ignore_for_file: prefer_const_constructors

import 'package:crm_app/core/init/theme/light/color_scheme_light.dart';

import '../../../../../../core/components/text/body_text1_copy.dart';
import '../../../../../../core/components/text/body_text2_copy.dart';
import '../../../../../../core/constants/app/app_constants.dart';
import '../../../../../../product/widgets/card/check_box_card.dart';
import 'package:dio/dio.dart';

import '../../../../contact/viewmodel/contact_view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class SendMailView extends StatefulWidget {
  const SendMailView({Key? key}) : super(key: key);

  @override
  State<SendMailView> createState() => _SendMailViewState();
}

class _SendMailViewState extends State<SendMailView> {
  final ContactViewModel _viewModel = ContactViewModel();
  var titleController = TextEditingController();
  var contentController = TextEditingController();
  var nameController = TextEditingController();
  var eMailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _viewModel.fetchItems(ApplicationConstants.instance!.token);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Image.network(
              "http://192.168.3.53/assets/images/logo-light.png",
              width: context.dynamicWidth(0.28),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              height: context.dynamicHeight(1.6),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: context.paddingNormal,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(context.lowValue),
                        ),
                        elevation: 5,
                        child: Padding(
                          padding: context.paddingNormal,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Padding(
                                  padding: context.paddingLow,
                                  child: const BodyText1Copy(data: "Kişilerim"),
                                ),
                              ),
                              context.emptySizedHeightBoxLow,
                              Expanded(
                                child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: _viewModel.lenght,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        index < _viewModel.items.users!.length
                                            ? CheckBoxCard(
                                                isSelect: _viewModel.items
                                                    .users![index].isSelect,
                                                data: _viewModel
                                                        .items
                                                        .users?[index]
                                                        .full_name ??
                                                    "",
                                                userId: _viewModel.items
                                                        .users?[index].id ??
                                                    "0",
                                              )
                                            : const SizedBox(),
                                        index < _viewModel.items.guides!.length
                                            ? CheckBoxCard(
                                                isSelect: _viewModel.items
                                                    .guides![index].isSelect,
                                                data: _viewModel.items
                                                        .guides?[index].name ??
                                                    "",
                                                guiId: _viewModel.items
                                                        .guides?[index].id ??
                                                    "0",
                                              )
                                            : const SizedBox()
                                      ],
                                    );
                                  },
                                ),
                              ),
                              context.emptySizedHeightBoxLow,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: context.paddingNormal,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(context.lowValue),
                        ),
                        elevation: 5,
                        child: Padding(
                          padding: context.paddingNormal,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Padding(
                                  padding: context.paddingLow,
                                  child: const BodyText1Copy(
                                      data: "Kayıtlı olmayan eposta ekle"),
                                ),
                              ),
                              context.emptySizedHeightBoxLow3x,
                              TextField(
                                controller: nameController,
                                decoration: InputDecoration(
                                  filled: true,
                                  prefixIcon: const Icon(Icons.portrait),
                                  hintText: 'Kişinin adı soyadını giriniz.',
                                  labelText: 'Ad soyad',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: context.lowBorderRadius,
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: context.lowBorderRadius,
                                    borderSide: BorderSide(
                                        color: context.colorScheme.surface),
                                  ),
                                ),
                                cursorColor: context.colorScheme.onSecondary,
                              ),
                              context.emptySizedHeightBoxLow3x,
                              TextField(
                                controller: eMailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  filled: true,
                                  prefixIcon: Icon(Icons.mail_outline_outlined),
                                  hintText: 'Kişinin emailini giriniz.',
                                  labelText: 'Email',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: context.lowBorderRadius,
                                    borderSide: BorderSide(color: Colors.grey),
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
                              Center(
                                child: SizedBox(
                                  width: context.dynamicWidth(0.385),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      Dio dio = Dio();
                                      await dio.post(
                                          "http://192.168.3.53/api/Persons/new_guide?token=${ApplicationConstants.instance!.token}&name=${nameController.text}&email=${eMailController.text}");
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          backgroundColor: context
                                              .colorScheme.secondaryVariant,
                                          duration: context.durationSlow,
                                          content: BodyText2Copy(
                                            data: "Kişi başarıyla eklendi !",
                                            color:
                                                context.colorScheme.onSurface,
                                          ),
                                        ),
                                      );
                                      setState(() {
                                        _viewModel.fetchItems(
                                            ApplicationConstants
                                                .instance!.token);
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.person_add,
                                          color: ColorSchemeLight.instance.java,
                                        ),
                                        context.emptySizedWidthBoxLow,
                                        Text(
                                          "Kişilerime Ekle",
                                          style: TextStyle(
                                              color: ColorSchemeLight
                                                  .instance.java),
                                        ),
                                      ],
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary:
                                          ColorSchemeLight.instance.hummingBird,
                                      shadowColor:
                                          ColorSchemeLight.instance.java,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: context.paddingNormal,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(context.lowValue),
                        ),
                        elevation: 4,
                        child: Padding(
                          padding: context.paddingNormal,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              context.emptySizedHeightBoxLow,
                              Padding(
                                padding: context.paddingLow,
                                child: const Text("Başlık"),
                              ),
                              context.emptySizedHeightBoxLow,
                              TextField(
                                controller: titleController,
                                decoration: InputDecoration(
                                  filled: true,
                                  hintText: 'Mailin başlığını giriniz.',
                                  labelText: "Başlık",
                                  prefixIcon: const Icon(Icons.title),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: context.lowBorderRadius,
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: context.lowBorderRadius,
                                    borderSide: BorderSide(
                                        color: context.colorScheme.surface),
                                  ),
                                ),
                                cursorColor: context.colorScheme.onSecondary,
                              ),
                              context.emptySizedHeightBoxLow3x,
                              Padding(
                                padding: context.paddingLow,
                                child: const Text("İçerik"),
                              ),
                              TextField(
                                controller: contentController,
                                decoration: InputDecoration(
                                  filled: true,
                                  hintText: 'İçerik',
                                  labelText: "Mail içeriğini giriniz.",
                                  prefixIcon: const Icon(Icons.content_paste),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: context.lowBorderRadius,
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: context.lowBorderRadius,
                                    borderSide: BorderSide(
                                        color: context.colorScheme.surface),
                                  ),
                                ),
                                cursorColor: context.colorScheme.onSecondary,
                                maxLines: 13,
                              ),
                              context.emptySizedHeightBoxLow,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: context.horizontalPaddingMedium,
                      child: SizedBox(
                        width: context.dynamicWidth(0.39),
                        child: ElevatedButton(
                            onPressed: () {
                              List<String> userId =
                                  ApplicationConstants.instance!.userId;
                              List<String> guiId =
                                  ApplicationConstants.instance!.guiId;
                              String token =
                                  ApplicationConstants.instance!.token;
                              Dio dio = Dio();
                              if (userId.isNotEmpty && guiId.isEmpty) {
                                for (var i = 0; i < userId.length; i++) {
                                  dio.post(
                                      "http://192.168.3.53/api/Email/send_email?user_id=u${userId[i]}&token=$token&title=${titleController.text}&content=${contentController.text}");
                                }
                              } else if (userId.isEmpty && guiId.isNotEmpty) {
                                for (var i = 0; i < userId.length; i++) {
                                  dio.post(
                                      "http://192.168.3.53/api/Email/send_email?user_id=g${guiId[i]}&token=$token&title=${titleController.text}&content=${contentController.text}");
                                }
                              } else if (userId.isNotEmpty &&
                                  guiId.isNotEmpty) {
                                for (var i = 0; i < userId.length; i++) {
                                  dio.post(
                                      "http://192.168.3.53/api/Email/send_email?user_id=g${guiId[i]}&token=$token&title=${titleController.text}&content=${contentController.text}");
                                }
                                for (var i = 0; i < userId.length; i++) {
                                  dio.post(
                                      "http://192.168.3.53/api/Email/send_email?user_id=u${userId[i]}&token=$token&title=${titleController.text}&content=${contentController.text}");
                                }
                              }
                              Navigator.of(context).pop();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor:
                                      context.colorScheme.secondaryVariant,
                                  duration: context.durationSlow,
                                  content: BodyText2Copy(
                                    data: "Mail başarıyla gönderildi!",
                                    color: context.colorScheme.onSurface,
                                  ),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.send,
                                  color: context.colorScheme.surface,
                                ),
                                context.emptySizedWidthBoxLow,
                                Text(
                                  "Eposta Gönder",
                                  style: TextStyle(
                                      color: context.colorScheme.surface),
                                ),
                              ],
                            ),
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.hovered)) {
                                    return context.colorScheme.surface
                                        .withOpacity(0.2);
                                  }
                                  if (states.contains(MaterialState.focused) ||
                                      states.contains(MaterialState.pressed)) {
                                    return context.colorScheme.surface
                                        .withOpacity(0.2);
                                  }
                                  return Colors
                                      .red; // Defer to the widget's default.
                                },
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xffe8f4f8)),
                            )),
                      ),
                    ),
                  ),
                  context.emptySizedHeightBoxLow,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
