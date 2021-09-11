// ignore_for_file: prefer_const_constructors

import 'package:crm_app/core/components/text/subtitle1_copy.dart';
import 'package:crm_app/core/init/theme/light/color_scheme_light.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../../core/components/text/body_text1_copy.dart';
import '../../../../core/components/text/body_text2_copy.dart';
import '../../../../core/constants/app/app_constants.dart';
import 'package:dio/dio.dart';

import 'send_mail/view/send_mail_view.dart';

import '../viewmodel/mail_view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kartal/kartal.dart';

class MailView extends StatelessWidget {
  final MailViewModel viewModel;
  final String title;

  const MailView({Key? key, required this.viewModel, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String token = ApplicationConstants.instance!.token;
    MediaQueryData mediaQuery = MediaQuery.of(context);

    double height = mediaQuery.size.height;

    double radius = height * 0.02;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(color: context.colorScheme.onSecondary),
        ),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Observer(
        builder: (context) => Column(
          children: [
            Expanded(
              flex: 7,
              child: Padding(
                padding: context.paddingLow,
                child: ListView.builder(
                  itemCount: viewModel.items.emails?.length ?? 0,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => Column(
                    children: [
                      Slidable(
                        actionPane: const SlidableDrawerActionPane(),
                        actions: [
                          IconSlideAction(
                            color: context.colorScheme.primaryVariant,
                            caption: 'Sil',
                            icon: Icons.delete,
                            onTap: () async {
                              Dio dio = Dio();
                              await dio.post(
                                  "http://192.168.3.53/api/Email/email_move?id=${viewModel.items.emails?[index].id}&folder=trash&token=$token");
                              viewModel.fetchItems(token, "is_active");
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor:
                                      context.colorScheme.secondaryVariant,
                                  duration: context.durationSlow,
                                  content: BodyText2Copy(
                                    data: "Mail çöp kutusu klasörüne eklendi !",
                                    color: context.colorScheme.onSurface,
                                  ),
                                ),
                              );
                            },
                          ),
                          IconSlideAction(
                            color: context.colorScheme.error,
                            foregroundColor: context.colorScheme.onSurface,
                            caption: 'Ertele',
                            icon: Icons.alarm,
                            onTap: () async {
                              Dio dio = Dio();
                              await dio.post(
                                  "http://192.168.3.53/api/Email/email_move?id=${viewModel.items.emails?[index].id}&folder=snoozed&token=$token");
                              viewModel.fetchItems(token, "is_active");
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor:
                                      context.colorScheme.secondaryVariant,
                                  duration: context.durationSlow,
                                  content: BodyText2Copy(
                                    data:
                                        "Mail ertelenenler klasörüne eklendi !",
                                    color: context.colorScheme.onSurface,
                                  ),
                                ),
                              );
                            },
                          ),
                          IconSlideAction(
                            color: context.colorScheme.onPrimary,
                            foregroundColor: context.colorScheme.onSurface,
                            caption: 'Taslak',
                            icon: Icons.article_outlined,
                            onTap: () async {
                              debugPrint(token);
                              Dio dio = Dio();
                              await dio.post(
                                  "http://192.168.3.53/api/Email/email_move?id=${viewModel.items.emails?[index].id}&folder=draft&token=$token");
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor:
                                      context.colorScheme.secondaryVariant,
                                  duration: context.durationSlow,
                                  content: BodyText2Copy(
                                    data: "Mail taslak klasörüne eklendi !",
                                    color: context.colorScheme.onSurface,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                        secondaryActions: [
                          IconSlideAction(
                            color: context.colorScheme.error,
                            foregroundColor: context.colorScheme.onSurface,
                            caption: 'Spam',
                            icon: Icons.warning,
                            onTap: () async {
                              Dio dio = Dio();
                              await dio.post(
                                  "http://192.168.3.53/api/Email/email_move?id=${viewModel.items.emails?[index].id}&folder=spam&token=$token");
                              viewModel.fetchItems(token, "is_active");
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor:
                                      context.colorScheme.secondaryVariant,
                                  duration: context.durationSlow,
                                  content: BodyText2Copy(
                                    data: "Mail spam klasörüne eklendi !",
                                    color: context.colorScheme.onSurface,
                                  ),
                                ),
                              );
                            },
                          ),
                          IconSlideAction(
                            color: context.colorScheme.onError,
                            foregroundColor: context.colorScheme.onSurface,
                            caption: 'Önemli',
                            icon: Icons.label,
                            onTap: () async {
                              Dio dio = Dio();
                              await dio.post(
                                  "http://192.168.3.53/api/Email/email_move?id=${viewModel.items.emails?[index].id}&folder=important&token=$token");
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor:
                                      context.colorScheme.secondaryVariant,
                                  duration: context.durationSlow,
                                  content: BodyText2Copy(
                                    data:
                                        "Mail ertelenenler klasörüne eklendi !",
                                    color: context.colorScheme.onSurface,
                                  ),
                                ),
                              );
                            },
                          ),
                          IconSlideAction(
                            color: context.colorScheme.surface,
                            foregroundColor: context.colorScheme.onSurface,
                            caption: 'Okundu',
                            icon: Icons.mark_email_read,
                            onTap: () async {
                              Dio dio = Dio();
                              await dio.post(
                                  "http://192.168.3.53/api/Email/read_it?id=${viewModel.items.emails?[index].id}&folder=read&token=$token");
                              viewModel.fetchItems(token, "is_active");
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor:
                                      context.colorScheme.secondaryVariant,
                                  duration: context.durationSlow,
                                  content: BodyText2Copy(
                                    data: "Mail okundu olarak işaretlendi !",
                                    color: context.colorScheme.onSurface,
                                  ),
                                ),
                              );
                            },
                          ),
                          IconSlideAction(
                            color: context.colorScheme.secondaryVariant,
                            foregroundColor: context.colorScheme.onSurface,
                            caption: 'Okunmadı',
                            icon: Icons.mark_email_unread,
                            onTap: () async {
                              Dio dio = Dio();
                              await dio.post(
                                  "http://192.168.3.53/api/Email/read_it?id=${viewModel.items.emails?[index].id}&folder=unread&token=$token");
                              viewModel.fetchItems(token, "is_active");
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor:
                                      context.colorScheme.secondaryVariant,
                                  duration: context.durationSlow,
                                  content: BodyText2Copy(
                                    data: "Mail okunmadı olarak işaretlendi !",
                                    color: context.colorScheme.onSurface,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: context.lowBorderRadius),
                          elevation: 5,
                          child: ListTile(
                            leading: SizedBox(
                              width: context.dynamicWidth(0.21),
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () async {
                                      Dio dio = Dio();
                                      await dio.post(
                                          "http://192.168.3.53/api/Email/email_move?id=${viewModel.items.emails?[index].id}&folder=starred&token=$token");
                                      viewModel.fetchItems(token, "is_active");
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          backgroundColor: context
                                              .colorScheme.secondaryVariant,
                                          duration: context.durationSlow,
                                          content: BodyText2Copy(
                                            data:
                                                "Mail yıldızlı klasörüne taşındı !",
                                            color:
                                                context.colorScheme.onSurface,
                                          ),
                                        ),
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.star,
                                      color: Colors.grey,
                                    ),
                                    color: context.colorScheme.primaryVariant,
                                  ),
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(viewModel
                                            .items.emails?[index].user_photo ??
                                        "http://192.168.3.53/assets/images/users/user0.jpg"),
                                  )
                                ],
                              ),
                            ),
                            title: Text(
                                viewModel.items.emails?[index].user_name ??
                                    "Geçerli isim bulunamadı."),
                            subtitle: Subtitle1Copy(
                                data: viewModel.items.emails?[index].title ??
                                    "Geçerli mail başlığı bulunamadı."),
                            trailing: Subtitle1Copy(
                                data: viewModel.items.emails?[index].date ??
                                    "Geçerli tarih bulunamadı."),
                            onTap: () {
                              _showModalBottomSheet(
                                  context,
                                  radius,
                                  viewModel,
                                  index,
                                  viewModel.items.emails?[index].user_id ?? "0",
                                  token);
                            },
                          ),
                        ),
                      ),
                      context.emptySizedHeightBoxLow,
                    ],
                  ),
                ),
              ),
            ),
            context.emptySizedHeightBoxLow,
            Padding(
              padding: context.paddingNormal,
              child: const Text(
                "Mailleri silmek veya düzenlemek için sağa okundu veya okunmadı olarak işaretlemek için sola kaydırın.",
                maxLines: 2,
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: context.paddingLow,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SendMailView()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.email,
                          color: context.colorScheme.onSurface,
                        ),
                        context.emptySizedWidthBoxLow,
                        Text(
                          "Email Gönder",
                          style:
                              TextStyle(color: context.colorScheme.onSurface),
                        ),
                      ],
                    ),
                    // style: ElevatedButton.styleFrom(
                    //   primary: context.colorScheme.background,
                    //   shape: RoundedRectangleBorder(
                    //       borderRadius: context.lowBorderRadius),
                    //),
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                          context.colorScheme.background),
                      overlayColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered)) {
                            return context.colorScheme.onBackground
                                .withOpacity(0.2);
                          }
                          if (states.contains(MaterialState.focused) ||
                              states.contains(MaterialState.pressed)) {
                            return context.colorScheme.onBackground
                                .withOpacity(0.2);
                          }
                          return Colors.red; // Defer to the widget's default.
                        },
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          context.colorScheme.background),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _showModalBottomSheet(context, double radius, MailViewModel viewModel,
      int index, String id, String token) {
    var titleController = TextEditingController();
    var contentController = TextEditingController();
    String htmlData = """
    ${viewModel.items.emails?[index].content}
    """;

    debugPrint(htmlData);

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      builder: (BuildContext context) {
        return Observer(
          builder: (_) => AnimatedContainer(
            duration: context.durationNormal,
            padding: context.paddingNormal,
            height: viewModel.isContainerHeightChange
                ? context.dynamicHeight(0.5)
                : context.dynamicHeight(0.95),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                context.emptySizedHeightBoxLow,
                Center(
                  child: Container(
                    height: context.dynamicWidth(0.03),
                    width: context.dynamicWidth(0.2),
                    decoration: BoxDecoration(
                        borderRadius: context.lowBorderRadius,
                        color: Colors.grey),
                  ),
                ),
                context.emptySizedHeightBoxLow3x,
                Divider(
                  color: Colors.grey,
                  indent: 20,
                  endIndent: 20,
                ),
                Padding(
                  padding: context.paddingLow,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            viewModel.items.emails?[index].user_photo ?? ""),
                        radius: 30,
                      ),
                      context.emptySizedWidthBoxLow,
                      Expanded(
                        child: ListTile(
                          title: BodyText1Copy(
                              data: viewModel.items.emails?[index].user_name ??
                                  "Geçerli kullanıcı adı bulunamadı."),
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BodyText2Copy(
                                data: "Kimden Geldi: ",
                                color: Colors.grey,
                              ),
                              BodyText2Copy(
                                  data: viewModel
                                          .items.emails?[index].user_email ??
                                      "Geçerli eposta adresi bulunamadı.",
                                  color: Colors.grey),
                              context.emptySizedHeightBoxLow,
                            ],
                          ),
                          trailing: Text(viewModel.items.emails?[index].date ??
                              "Geçerli tarih bulunamadı."),
                        ),
                      ),
                    ],
                  ),
                ),
                context.emptySizedHeightBoxLow,
                SizedBox(
                  height: context.dynamicHeight(0.1),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: context.horizontalPaddingNormal,
                      child: Html(
                        data: htmlData,
                      ),
                    ),
                  ),
                ),
                context.emptySizedHeightBoxLow,
                Divider(
                  color: Colors.grey,
                  indent: 20,
                  endIndent: 20,
                ),
                viewModel.isContainerHeightChange
                    ? context.emptySizedWidthBoxLow
                    : Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: SizedBox(
                            height: context.dynamicHeight(0.5),
                            child: Padding(
                              padding: context.paddingLow,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: context.paddingLow,
                                    child: const Text("Başlık"),
                                  ),
                                  context.emptySizedHeightBoxLow,
                                  TextField(
                                    controller: titleController,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(Icons.title),
                                      hintText:
                                          'Epostanızın başlığını giriniz.',
                                      labelText: 'Başlık',
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: context.lowBorderRadius,
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: context.lowBorderRadius,
                                        borderSide: BorderSide(
                                            color: context.colorScheme.surface),
                                      ),
                                    ),
                                    cursorColor:
                                        context.colorScheme.onSecondary,
                                  ),
                                  context.emptySizedHeightBoxLow,
                                  Padding(
                                    padding: context.paddingLow,
                                    child: const Text("İçerik"),
                                  ),
                                  context.emptySizedHeightBoxLow,
                                  TextField(
                                    controller: contentController,
                                    decoration: InputDecoration(
                                      prefixIcon:
                                          const Icon(Icons.content_paste),
                                      hintText: "Eposta içeriğini giriniz.",
                                      labelText: 'İçerik',
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: context.lowBorderRadius,
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: context.lowBorderRadius,
                                        borderSide: BorderSide(
                                            color: context.colorScheme.surface),
                                      ),
                                    ),
                                    cursorColor:
                                        context.colorScheme.onSecondary,
                                    maxLines: 8,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                Padding(
                  padding: context.horizontalPaddingLow,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      viewModel.isContainerHeightChange
                          ? context.emptySizedHeightBoxLow
                          : ElevatedButton(
                              onPressed: () async {
                                debugPrint("Id:" + id);
                                Dio dio = Dio();
                                await dio.post(
                                    "http://192.168.3.53/api/Email/send_email?user_id=u$id&token=$token&title=${titleController.text}&content=${contentController.text}");
                                Navigator.of(context).pop();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor:
                                        context.colorScheme.secondaryVariant,
                                    duration: context.durationSlow,
                                    content: BodyText2Copy(
                                      data: "Başarıyla çıkış yapıldı !",
                                      color: context.colorScheme.onSurface,
                                    ),
                                  ),
                                );
                              },
                              child: BodyText2Copy(
                                data: "Gönder",
                                color: context.colorScheme.primaryVariant,
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: ColorSchemeLight.instance.pippin,
                                shape: RoundedRectangleBorder(
                                  borderRadius: context.lowBorderRadius,
                                ),
                              ),
                            ),
                      context.emptySizedWidthBoxLow3x,
                      ElevatedButton(
                        onPressed: () {
                          viewModel.changeContainerHeight();
                        },
                        child: BodyText2Copy(
                          data: "Yanıtla",
                          color: context.colorScheme.onPrimary,
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: ColorSchemeLight.instance.hummingBird,
                          shape: RoundedRectangleBorder(
                            borderRadius: context.lowBorderRadius,
                          ),
                        ),
                      ),
                      context.emptySizedWidthBoxLow3x,
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: BodyText2Copy(
                          data: "Vazgeç",
                          color: context.colorScheme.background,
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: ColorSchemeLight.instance.amour,
                          shape: RoundedRectangleBorder(
                            borderRadius: context.lowBorderRadius,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
