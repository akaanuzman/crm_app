// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:crm_app/core/components/text/body_text1_copy.dart';
import 'package:crm_app/core/components/text/body_text2_copy.dart';
import 'package:crm_app/core/components/text/bold_text.dart';
import 'package:crm_app/core/components/text/subtitle1_copy.dart';
import 'package:crm_app/core/constants/app/app_constants.dart';
import 'package:crm_app/core/init/theme/light/color_scheme_light.dart';
import 'package:crm_app/feature/home/company/view/company_view.dart';
import 'package:crm_app/feature/home/contact/view/contact_view.dart';
import 'package:crm_app/feature/home/profile/viewmodel/experience/experience_view_model.dart';
import 'package:crm_app/feature/home/profile/viewmodel/profile/profile_view_model.dart';
import 'package:crm_app/feature/home/project/projectdetail/view/project_detail_view.dart';
import 'package:crm_app/feature/home/project/viewmodel/project_view_model.dart';

import 'package:dio/dio.dart';
import 'package:evil_icons_flutter/evil_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:geira_icons/geira_icons.dart';
import 'package:kartal/kartal.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    double height = mediaQuery.size.height;

    double radius = height * 0.02;

    final ProfileViewModel _viewModel = ProfileViewModel();
    final ProjectViewModel _projectViewModel = ProjectViewModel();
    final ExperienceViewModel _experienceViewModel = ExperienceViewModel();

    _viewModel.fetchItems(ApplicationConstants.instance!.token, "");

    return Scaffold(
        body: Observer(
      builder: (context) => SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SizedBox(
          height: context.dynamicHeight(1.6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: context.paddingLow,
                  child: Card(
                    elevation: 3,
                    child: Column(
                      children: [
                        context.emptySizedHeightBoxLow,
                        CircleAvatar(
                          radius: 45,
                          backgroundImage: NetworkImage(_viewModel
                                  .items.photo ??
                              "http:/192.168.3.53/assets/images/users/user0.jpg"),
                        ),
                        context.emptySizedHeightBoxLow,
                        BodyText1Copy(data: _viewModel.items.full_name ?? ""),
                        Text(_viewModel.items.user_name ?? ""),
                        context.emptySizedHeightBoxLow,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ContactView()));
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.group,
                                    color: ColorSchemeLight.instance.mandy,
                                  ),
                                  context.emptySizedWidthBoxLow,
                                  BodyText2Copy(
                                      data: "Kişilerim",
                                      color: ColorSchemeLight.instance.mandy),
                                ],
                              ),
                              style: ButtonStyle(
                                overlayColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.hovered)) {
                                      return context.colorScheme.onBackground
                                          .withOpacity(0.2);
                                    }
                                    if (states
                                            .contains(MaterialState.focused) ||
                                        states
                                            .contains(MaterialState.pressed)) {
                                      return context.colorScheme.onBackground
                                          .withOpacity(0.2);
                                    }
                                    return Colors
                                        .red; // Defer to the widget's default.
                                  },
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        ColorSchemeLight.instance.pippin),
                              ),
                            ),
                            context.emptySizedWidthBoxLow,
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => CompanyView()));
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.apartment,
                                    color: context.colorScheme.surface,
                                  ),
                                  context.emptySizedWidthBoxLow,
                                  BodyText2Copy(
                                      data: "Firmalarım",
                                      color: context.colorScheme.surface),
                                ],
                              ),
                              style: ButtonStyle(
                                overlayColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.hovered)) {
                                      return context.colorScheme.surface
                                          .withOpacity(0.2);
                                    }
                                    if (states
                                            .contains(MaterialState.focused) ||
                                        states
                                            .contains(MaterialState.pressed)) {
                                      return context.colorScheme.surface
                                          .withOpacity(0.2);
                                    }
                                    return Colors
                                        .red; // Defer to the widget's default.
                                  },
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xffe8f4f8)),
                              ),
                            ),
                          ],
                        ),
                        context.emptySizedHeightBoxLow,
                        Padding(
                          padding: context.paddingNormal,
                          child: Row(
                            children: [
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: BoldText(data: "HAKKIMDA: "),
                              ),
                              context.emptySizedWidthBoxLow,
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(_viewModel.items.detail ?? ""),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: context.paddingNormal,
                          child: Row(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Tam isim:",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              context.emptySizedWidthBoxLow,
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(_viewModel.items.full_name ?? ""),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: context.paddingNormal,
                          child: Row(
                            // ignore:
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Telefon :",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              context.emptySizedWidthBoxLow,
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(_viewModel.items.telephone ??
                                    "Geçerli telefon numarası bulunamadı."),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: context.paddingNormal,
                          child: Row(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Eposta :",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              context.emptySizedWidthBoxLow,
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(_viewModel.items.email ??
                                    "Geçerli eposta adresi bulunamadi."),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: context.paddingNormal,
                          child: Row(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Şirket :",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              context.emptySizedWidthBoxLow,
                              Align(
                                alignment: Alignment.centerLeft,
                                child:
                                    Text(_viewModel.items.company_name ?? ""),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: context.paddingNormal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                radius: 28,
                                child: Icon(
                                  GIcons.instagram,
                                  size: 48,
                                  color: context.colorScheme.onSurface,
                                ),
                                backgroundColor: Color(0xff9935B4),
                              ),
                              CircleAvatar(
                                radius: 28,
                                child: Icon(
                                  EvilIcons.sc_github,
                                  size: 48,
                                  color: context.colorScheme.onSurface,
                                ),
                                backgroundColor:
                                    context.colorScheme.secondaryVariant,
                              ),
                              CircleAvatar(
                                radius: 28,
                                child: Icon(
                                  EvilIcons.sc_linkedin,
                                  size: 48,
                                  color: context.colorScheme.onSurface,
                                ),
                                backgroundColor: Color(0xff0A66C2),
                              ),
                              CircleAvatar(
                                radius: 28,
                                child: Icon(
                                  EvilIcons.sc_twitter,
                                  size: 48,
                                  color: context.colorScheme.onSurface,
                                ),
                                backgroundColor: Color(0xff1DA1F2),
                              ),
                              CircleAvatar(
                                radius: 28,
                                child: Icon(
                                  EvilIcons.sc_facebook,
                                  size: 48,
                                  color: context.colorScheme.onSurface,
                                ),
                                backgroundColor: Color(0xff17A8FD),
                              ),
                              CircleAvatar(
                                radius: 28,
                                child: Icon(
                                  Icons.language,
                                  size: 48,
                                  color: context.colorScheme.onSurface,
                                ),
                                backgroundColor: context.colorScheme.onPrimary,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: context.paddingLow,
                  child: Card(
                    elevation: 3,
                    child: Padding(
                      padding: context.paddingNormal,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.work),
                              context.emptySizedWidthBoxLow,
                              BodyText1Copy(data: "DENEYİMLERİM"),
                            ],
                          ),
                          context.emptySizedHeightBoxLow3x,
                          Expanded(
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount:
                                  _experienceViewModel.items.timeline?.length ??
                                      0,
                              itemBuilder: (context, index) => Column(
                                children: [
                                  Slidable(
                                    actionPane:
                                        const SlidableDrawerActionPane(),
                                    secondaryActions: [
                                      IconSlideAction(
                                        color:
                                            context.colorScheme.primaryVariant,
                                        caption: 'Sil',
                                        icon: Icons.delete,
                                        onTap: () {
                                          _showDialog(context, radius,
                                              _experienceViewModel, index);
                                        },
                                      ),
                                      IconSlideAction(
                                        color: context.colorScheme.onPrimary,
                                        foregroundColor:
                                            context.colorScheme.onSurface,
                                        caption: 'Düzenle',
                                        icon: Icons.edit,
                                        onTap: () {
                                          _showModalBottomSheet(context, radius,
                                              _experienceViewModel, false,
                                              index: index);
                                        },
                                      ),
                                    ],
                                    child: ListTile(
                                      leading: Icon(Icons.info),
                                      title: BodyText2Copy(
                                        data: _experienceViewModel
                                                .items.timeline?[index].title ??
                                            "",
                                        fontWeight: FontWeight.bold,
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Subtitle1Copy(
                                              data: _experienceViewModel
                                                      .items
                                                      .timeline?[index]
                                                      .subtitle ??
                                                  ""),
                                          Subtitle1Copy(
                                              data: _experienceViewModel
                                                      .items
                                                      .timeline?[index]
                                                      .detail ??
                                                  ""),
                                        ],
                                      ),
                                      trailing: Text(_experienceViewModel
                                              .items.timeline?[index].date ??
                                          ""),
                                    ),
                                  ),
                                  context.emptySizedHeightBoxLow,
                                  Divider(
                                    color: Colors.grey,
                                    indent: 15,
                                    endIndent: 15,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.dynamicWidth(0.352),
                            child: ElevatedButton(
                              onPressed: () {
                                _showModalBottomSheet(context, radius,
                                    _experienceViewModel, true);
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.note_add,
                                    color: context.colorScheme.onError,
                                  ),
                                  context.emptySizedHeightBoxLow,
                                  Text(
                                    "Deneyim Ekle",
                                    style: TextStyle(
                                        color: context.colorScheme.onError),
                                  ),
                                ],
                              ),
                              style: ButtonStyle(
                                overlayColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.hovered)) {
                                      return context.colorScheme.onError
                                          .withOpacity(0.2);
                                    }
                                    if (states
                                            .contains(MaterialState.focused) ||
                                        states
                                            .contains(MaterialState.pressed)) {
                                      return context.colorScheme.onError
                                          .withOpacity(0.2);
                                    }
                                    return Colors
                                        .red; // Defer to the widget's default.
                                  },
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xffE6E6FA)),
                              ),
                            ),
                          ),
                          context.emptySizedHeightBoxLow3x,
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.task_alt),
                                    context.emptySizedWidthBoxLow,
                                    BodyText1Copy(data: "PROJELERİM"),
                                  ],
                                ),
                                context.emptySizedHeightBoxLow3x,
                                Expanded(
                                  child: ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    itemCount: _projectViewModel
                                            .items.projects?.length ??
                                        0,
                                    itemBuilder: (context, index) => Column(
                                      children: [
                                        ListTile(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ProjectDetailView(
                                                  allTask: _projectViewModel
                                                          .items
                                                          .projects?[index]
                                                          .allgorev ??
                                                      0,
                                                  okTask: _projectViewModel
                                                          .items
                                                          .projects?[index]
                                                          .okgorev ??
                                                      0,
                                                  projectId: _projectViewModel
                                                          .items
                                                          .projects?[index]
                                                          .id ??
                                                      "0",
                                                ),
                                              ),
                                            );
                                          },
                                          leading: Icon(Icons.event),
                                          title: BodyText2Copy(
                                            data: _projectViewModel.items
                                                    .projects?[index].name ??
                                                "Geçerli proje ismi bulunamadı.",
                                            fontWeight: FontWeight.bold,
                                          ),
                                          subtitle: Subtitle1Copy(
                                              data: _projectViewModel
                                                      .items
                                                      .projects?[index]
                                                      .detail ??
                                                  "Geçerli detay bulunamadı."),
                                          trailing:
                                              Icon(Icons.keyboard_arrow_right),
                                        ),
                                        Divider(
                                          color: Colors.grey,
                                          indent: 15,
                                          endIndent: 15,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  _showModalBottomSheet(context, double radius,
      ExperienceViewModel experienceViewModel, bool addOrEdit,
      {int index = 0}) {
    DateTime _now = DateTime.now();
    var titleController = TextEditingController();
    var subtitleController = TextEditingController();
    var dateController = TextEditingController();
    var detailController = TextEditingController();

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      builder: (BuildContext context) {
        return Container(
          height: context.dynamicHeight(0.75),
          padding: context.paddingNormal,
          decoration: BoxDecoration(
            color: context.colorScheme.onSurface,
            borderRadius: BorderRadius.only(
              topLeft: context.highadius,
              topRight: context.highadius,
            ),
          ),
          child: Column(
            children: [
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
              Padding(
                padding: context.paddingLow,
                child: const Text("Başlık"),
              ),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'Örn: Bilgisayar Mühendisi',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: context.lowBorderRadius,
                    borderSide: BorderSide(color: Colors.grey),
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
                child: const Text("Şirket-Okul Adı"),
              ),
              TextField(
                controller: subtitleController,
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'Örn: Kuvarssoft',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: context.lowBorderRadius,
                    borderSide: BorderSide(color: Colors.grey),
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
                child: const Text("Tarih"),
              ),
              TextField(
                controller: dateController,
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'mm/dd/yy',
                  prefixIcon: IconButton(
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          initialDate: _now,
                          firstDate: DateTime(DateTime.now().year - 5),
                          lastDate: DateTime(DateTime.now().year + 5),
                        );
                      },
                      icon: const Icon(Icons.calendar_today)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: context.lowBorderRadius,
                    borderSide: BorderSide(color: Colors.grey),
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
                controller: detailController,
                decoration: InputDecoration(
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: context.lowBorderRadius,
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: context.lowBorderRadius,
                    borderSide: BorderSide(color: context.colorScheme.surface),
                  ),
                ),
                cursorColor: context.colorScheme.onSecondary,
                maxLines: 3,
              ),
              context.emptySizedHeightBoxLow3x,
              Divider(
                color: Colors.grey,
              ),
              Padding(
                padding: context.paddingLow,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.close,
                            color: ColorSchemeLight.instance.mandy,
                          ),
                          BodyText2Copy(
                            data: "Vazgeç",
                            color: ColorSchemeLight.instance.mandy,
                          ),
                        ],
                      ),
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.hovered)) {
                              return context.colorScheme.onError
                                  .withOpacity(0.2);
                            }
                            if (states.contains(MaterialState.focused) ||
                                states.contains(MaterialState.pressed)) {
                              return context.colorScheme.onError
                                  .withOpacity(0.2);
                            }
                            return Colors.red; // Defer to the widget's default.
                          },
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            ColorSchemeLight.instance.pippin),
                      ),
                    ),
                    context.emptySizedWidthBoxLow,
                    ElevatedButton(
                      onPressed: () async {
                        String token = ApplicationConstants.instance!.token;
                        Dio dio = Dio();
                        if (addOrEdit) {
                          await dio.post(
                              "http://192.168.3.53/api/Persons/new_timeline?token=$token&date=${dateController.text}&title=${titleController.text}&subtitle=${subtitleController.text}&detail=${detailController.text}");
                          experienceViewModel.fetchItems(token);
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor:
                                  context.colorScheme.secondaryVariant,
                              duration: context.durationSlow,
                              content: BodyText2Copy(
                                data: "Deneyim başarıyla eklendi !",
                                color: context.colorScheme.onSurface,
                              ),
                            ),
                          );
                        } else {
                          await dio.post(
                              "http://192.168.3.53/api/Persons/update_timeline?token=$token&id=${experienceViewModel.items.timeline?[index].id}&date=${dateController.text}&title=${titleController.text}&subtitle=${subtitleController.text}&detail=${detailController.text}");
                          experienceViewModel.fetchItems(token);
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor:
                                  context.colorScheme.secondaryVariant,
                              duration: context.durationSlow,
                              content: BodyText2Copy(
                                data: "Deneyim başarıyla düzenlendi !",
                                color: context.colorScheme.onSurface,
                              ),
                            ),
                          );
                        }
                      },
                      child: Row(
                        children: [
                          Icon(addOrEdit ? Icons.add : Icons.edit,
                              color: ColorSchemeLight.instance.java),
                          context.emptySizedWidthBoxLow,
                          BodyText2Copy(
                              data: addOrEdit ? "Ekle" : "Kaydet",
                              color: ColorSchemeLight.instance.java),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: ColorSchemeLight.instance.hummingBird),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _showDialog(BuildContext context, double radius,
      ExperienceViewModel viewModel, int index) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
              ),
              title: const BodyText1Copy(
                  data: "Deneyimi silmek istediğinizden emin misiniz ?"),
              content: const BodyText2Copy(
                  data: "Deneyim kalıcı olarak silinecektir."),
              actions: [
                ElevatedButton(
                  child: Text("Evet",
                      style: TextStyle(color: context.colorScheme.onSurface)),
                  style: ElevatedButton.styleFrom(
                      primary: context.colorScheme.primaryVariant),
                  onPressed: () async {
                    String token = ApplicationConstants.instance!.token;
                    final Dio dio = Dio();
                    await dio.post(
                        "http://192.168.3.53/api/Persons/delete_timeline?token=$token&id=${viewModel.items.timeline?[index].id}");
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: context.colorScheme.secondaryVariant,
                        duration: context.durationSlow,
                        content: BodyText2Copy(
                          data: "Deneyim başarıyla silindi !",
                          color: context.colorScheme.onSurface,
                        ),
                      ),
                    );
                    viewModel.fetchItems(token);
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: context.colorScheme.secondaryVariant),
                  child: Text(
                    "Hayır",
                    style: TextStyle(color: context.colorScheme.onSurface),
                  ),
                )
              ],
            ));
  }
}
