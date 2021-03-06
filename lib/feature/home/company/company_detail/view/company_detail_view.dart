// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:crm_app/core/components/text/body_text1_copy.dart';
import 'package:crm_app/core/components/text/body_text2_copy.dart';
import 'package:crm_app/core/components/text/bold_text.dart';
import 'package:crm_app/core/constants/app/app_constants.dart';
import 'package:crm_app/core/init/theme/light/color_scheme_light.dart';
import 'package:crm_app/feature/home/company/viewmodel/company_view_model.dart';
import 'package:crm_app/feature/home/contact/model/contact_model.dart';
import 'package:crm_app/feature/home/contact/viewmodel/contact_view_model.dart';
import 'package:crm_app/product/widgets/card/check_box_card_v2.dart';
import 'package:dio/dio.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../viewmodel/company_detail_view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:popup_card/popup_card.dart';

class CompanyDetailView extends StatefulWidget {
  final String id;

  const CompanyDetailView({Key? key, required this.id}) : super(key: key);

  @override
  State<CompanyDetailView> createState() => _CompanyDetailViewState();
}

class _CompanyDetailViewState extends State<CompanyDetailView> {
  final CompanyDetailViewModel _viewModel = CompanyDetailViewModel();
  final CompanyViewModel _companyViewModel = CompanyViewModel();
  final ContactViewModel _contactViewModel = ContactViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.fetchItems(ApplicationConstants.instance!.token, widget.id);
    _contactViewModel.fetchItems(ApplicationConstants.instance!.token);
    _companyViewModel.fetchItems(ApplicationConstants.instance!.token);
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    double height = mediaQuery.size.height;

    double radius = height * 0.02;
    return Scaffold(
      appBar: AppBar(
        title: Image.network(
          "http://192.168.3.53/assets/images/logo-light.png",
          width: context.dynamicWidth(0.28),
        ),
        centerTitle: true,
      ),
      floatingActionButton:
          // _viewModel.items.access == "2" || _viewModel.items.access == "3" ?
          PopupItemLauncher(
        tag: 'Proje Ekle',
        child: Material(
          color: context.colorScheme.surface,
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: context.highBorderRadius),
          child: Icon(
            Icons.more_vert,
            size: 48,
            color: context.colorScheme.onSurface,
          ),
        ),
        popUp: PopUpItem(
          padding: EdgeInsets.zero,
          color: context.colorScheme.onSurface,
          shape:
              RoundedRectangleBorder(borderRadius: context.normalBorderRadius),
          elevation: 2,
          tag: 'Proje Ekle',
          child: PopUpItemBody(
            viewModel: _viewModel,
          ),
        ),
      ),
      // : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      body: Observer(
        builder: (context) => SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: context.dynamicHeight(1.85),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: context.paddingNormal,
                  child: Text(
                    _viewModel.items.name ?? "Ge??erli firma ad?? bulunamad??.",
                    style: context.textTheme.headline4!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.colorScheme.onSecondary),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: context.paddingLow,
                          child: Card(
                            child: Padding(
                              padding: context.paddingNormal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    child: Icon(
                                      Icons.person,
                                      size: context.dynamicWidth(0.1),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      BodyText1Copy(
                                        data: _viewModel.items.worker?.length
                                                .toString() ??
                                            "0",
                                        color: context.colorScheme.onSecondary,
                                      ),
                                      context.emptySizedHeightBoxLow,
                                      const BodyText2Copy(
                                          data: "??al????an Say??s??"),
                                    ],
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
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: context.paddingLow,
                          child: Card(
                            child: Padding(
                              padding: context.paddingNormal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    child: Icon(
                                      Icons.call,
                                      size: context.dynamicWidth(0.1),
                                    ),
                                    backgroundColor: context.colorScheme.error,
                                    foregroundColor:
                                        context.colorScheme.onSurface,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      BodyText1Copy(
                                        data: _viewModel.items.telephone ??
                                            "Ge??erli telefon numaras?? bulunamad??.",
                                        color: context.colorScheme.onSecondary,
                                      ),
                                      context.emptySizedHeightBoxLow,
                                      const BodyText2Copy(data: "Telefon"),
                                    ],
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
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: context.paddingLow,
                          child: Card(
                            child: Padding(
                              padding: context.paddingNormal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    child: Icon(
                                      Icons.event,
                                      size: context.dynamicWidth(0.1),
                                    ),
                                    backgroundColor:
                                        context.colorScheme.onPrimary,
                                    foregroundColor:
                                        context.colorScheme.onSurface,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      BodyText1Copy(
                                        data: _viewModel.items.web_site ??
                                            "Ge??erli web sitesi bulunamad??.",
                                        color: context.colorScheme.onSecondary,
                                      ),
                                      context.emptySizedHeightBoxLow,
                                      const BodyText2Copy(data: "Web Site"),
                                    ],
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
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: context.paddingLow,
                          child: Card(
                            child: Padding(
                              padding: context.paddingNormal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    child: Icon(
                                      Icons.email,
                                      size: context.dynamicWidth(0.1),
                                    ),
                                    backgroundColor:
                                        context.colorScheme.primaryVariant,
                                    foregroundColor:
                                        context.colorScheme.onSurface,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      BodyText1Copy(
                                        data: _viewModel.items.email ??
                                            "Ge??erli mail adresi bulunamad??.",
                                        color: context.colorScheme.onSecondary,
                                      ),
                                      context.emptySizedHeightBoxLow,
                                      const BodyText2Copy(data: "Eposta:"),
                                    ],
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
                context.emptySizedHeightBoxLow3x,
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: context.paddingLow,
                    child: Card(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: context.paddingNormal,
                                child: Text(
                                  "Bilgiler",
                                  style: context.textTheme.headline4!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: context.colorScheme.onSecondary),
                                ),
                              ),
                              _viewModel.items.access == "3"
                                  ? Padding(
                                      padding: context.horizontalPaddingNormal,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          String token = ApplicationConstants
                                              .instance!.token;
                                          Dio dio = Dio();
                                          dio.post(
                                              "http://192.168.3.53/api/Companys/delete_company?token=$token&id=${_viewModel.items.id}");
                                          Navigator.of(context).pop();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              backgroundColor: context
                                                  .colorScheme.secondaryVariant,
                                              duration: context.durationSlow,
                                              content: BodyText2Copy(
                                                data:
                                                    "Firma ba??ar??yla silindi !",
                                                color: context
                                                    .colorScheme.onSurface,
                                              ),
                                            ),
                                          );
                                          _companyViewModel.fetchItems(token);
                                        },
                                        child: Row(
                                          children: [
                                            Icon(Icons.delete,
                                                color: ColorSchemeLight
                                                    .instance.mandy),
                                            context.emptySizedWidthBoxLow,
                                            Text(
                                              "Firmay?? sil",
                                              style: TextStyle(
                                                color: ColorSchemeLight
                                                    .instance.mandy,
                                              ),
                                            ),
                                          ],
                                        ),
                                        style: ButtonStyle(
                                          overlayColor: MaterialStateProperty
                                              .resolveWith<Color>(
                                            (Set<MaterialState> states) {
                                              if (states.contains(
                                                  MaterialState.hovered)) {
                                                return context
                                                    .colorScheme.onBackground
                                                    .withOpacity(0.2);
                                              }
                                              if (states.contains(
                                                      MaterialState.focused) ||
                                                  states.contains(
                                                      MaterialState.pressed)) {
                                                return context
                                                    .colorScheme.onBackground
                                                    .withOpacity(0.2);
                                              }
                                              return Colors
                                                  .red; // Defer to the widget's default.
                                            },
                                          ),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  ColorSchemeLight
                                                      .instance.pippin),
                                        ),
                                      ),
                                    )
                                  : const SizedBox()
                            ],
                          ),
                          CircleAvatar(
                            radius: 64,
                            backgroundImage: NetworkImage(_viewModel
                                    .items.photo ??
                                "http://192.168.3.53/assets/images/companies/company.png"),
                            backgroundColor: context.colorScheme.onSurface,
                          ),
                          context.emptySizedHeightBoxLow3x,
                          Padding(
                            padding: context.horizontalPaddingNormal,
                            child: Row(
                              children: [
                                BoldText(
                                  data: "Email :",
                                ),
                                context.emptySizedWidthBoxLow,
                                Text(_viewModel.items.email ??
                                    "Ge??erli mail adresi bulunamad??."),
                              ],
                            ),
                          ),
                          const Divider(
                            thickness: 2,
                            indent: 15,
                            endIndent: 15,
                          ),
                          context.emptySizedHeightBoxLow,
                          Padding(
                            padding: context.horizontalPaddingNormal,
                            child: Row(
                              children: [
                                BoldText(
                                  data: "Telefon :",
                                ),
                                context.emptySizedWidthBoxLow,
                                Text(_viewModel.items.telephone ??
                                    "Ge??erli telefon numaras?? bulunamad??."),
                              ],
                            ),
                          ),
                          const Divider(
                            thickness: 2,
                            indent: 15,
                            endIndent: 15,
                          ),
                          context.emptySizedHeightBoxLow,
                          Padding(
                            padding: context.horizontalPaddingNormal,
                            child: Row(
                              children: [
                                BoldText(
                                  data: "Vergi Dairesi :",
                                ),
                                context.emptySizedWidthBoxLow,
                                Text(_viewModel.items.tax_department ??
                                    "Ge??erli vergi dairesi bulunamad??."),
                              ],
                            ),
                          ),
                          const Divider(
                            thickness: 2,
                            indent: 15,
                            endIndent: 15,
                          ),
                          context.emptySizedHeightBoxLow,
                          Padding(
                            padding: context.horizontalPaddingNormal,
                            child: Row(
                              children: [
                                BoldText(
                                  data: "Vergi Numaras?? :",
                                ),
                                context.emptySizedWidthBoxLow,
                                Text(_viewModel.items.tax_number ??
                                    "Ge??erli vergi numaras?? bulunamad??."),
                              ],
                            ),
                          ),
                          const Divider(
                            thickness: 2,
                            indent: 15,
                            endIndent: 15,
                          ),
                          context.emptySizedHeightBoxLow,
                          Padding(
                            padding: context.horizontalPaddingNormal,
                            child: Row(
                              children: [
                                BoldText(
                                  data: "Konum :",
                                ),
                                context.emptySizedWidthBoxLow,
                                Text(_viewModel.items.location ??
                                    "Ge??erli konum bulunamad??."),
                              ],
                            ),
                          ),
                          const Divider(
                            thickness: 2,
                            indent: 15,
                            endIndent: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                context.emptySizedHeightBoxLow3x,
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: context.paddingLow,
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: context.verticalPaddingLow,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: context.paddingNormal,
                                  child: Text(
                                    "??al????anlar",
                                    style: context.textTheme.headline4!
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: context
                                                .colorScheme.onSecondary),
                                  ),
                                ),
                                _viewModel.items.access == "3"
                                    ? Padding(
                                        padding:
                                            context.horizontalPaddingNormal,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            ApplicationConstants
                                                .instance!.accessLevel
                                                .clear();
                                            ApplicationConstants
                                                .instance!.userId
                                                .clear();
                                            _showModalBottomSheet(
                                                context,
                                                radius,
                                                _contactViewModel.items.users);
                                          },
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.person_add,
                                                color:
                                                    context.colorScheme.onError,
                                              ),
                                              context.emptySizedWidthBoxLow,
                                              Text(
                                                "??al????an Ekle",
                                                style: TextStyle(
                                                    color: context
                                                        .colorScheme.onError),
                                              ),
                                            ],
                                          ),
                                          style: ButtonStyle(
                                            overlayColor: MaterialStateProperty
                                                .resolveWith<Color>(
                                              (Set<MaterialState> states) {
                                                if (states.contains(
                                                    MaterialState.hovered)) {
                                                  return context
                                                      .colorScheme.onError
                                                      .withOpacity(0.2);
                                                }
                                                if (states.contains(
                                                        MaterialState
                                                            .focused) ||
                                                    states.contains(
                                                        MaterialState
                                                            .pressed)) {
                                                  return context
                                                      .colorScheme.onError
                                                      .withOpacity(0.2);
                                                }
                                                return Colors
                                                    .red; // Defer to the widget's default.
                                              },
                                            ),
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Color(0xffE6E6FA)),
                                          ),
                                        ),
                                      )
                                    : const SizedBox()
                              ],
                            ),
                          ),
                          context.emptySizedHeightBoxLow,
                          Expanded(
                            child: Padding(
                              padding: context.paddingLow,
                              child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: _viewModel.items.worker?.length ?? 0,
                                itemBuilder: (context, index) => Column(
                                  children: [
                                    Padding(
                                      padding: context.paddingLow,
                                      child: Slidable(
                                        actionPane:
                                            const SlidableDrawerActionPane(),
                                        secondaryActions: [
                                          IconSlideAction(
                                            color: context
                                                .colorScheme.primaryVariant,
                                            caption: 'Sil',
                                            icon: Icons.delete,
                                            onTap: () async {
                                              String token =
                                                  ApplicationConstants
                                                      .instance!.token;
                                              Dio dio = Dio();
                                              await dio.post(
                                                  "http://192.168.3.53/api/Companys/delete_access?token=$token&user_id=${_viewModel.items.worker?[index].id}&company_id=${_viewModel.items.id}");
                                              _viewModel.fetchItems(token,
                                                  _viewModel.items.id ?? "");
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  backgroundColor: context
                                                      .colorScheme
                                                      .secondaryVariant,
                                                  duration:
                                                      context.durationSlow,
                                                  content: BodyText2Copy(
                                                    data:
                                                        "??al????an ba??ar??yla silindi !",
                                                    color: context
                                                        .colorScheme.onSurface,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                        child: ExpansionTile(
                                          title: BodyText1Copy(
                                              data: _viewModel
                                                      .items
                                                      .worker?[index]
                                                      .full_name ??
                                                  "Ge??erli isim bulunamad??."),
                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(_viewModel.items
                                                      .worker?[index].email ??
                                                  "Ge??erli eposta adresi bulunamad??."),
                                              context.emptySizedWidthBoxLow3x,
                                              Text(_viewModel
                                                      .items
                                                      .worker?[index]
                                                      .telephone ??
                                                  "Ge??erli telefon numaras?? bulunamad??."),
                                            ],
                                          ),
                                          leading: const CircleAvatar(
                                            radius: 30,
                                            backgroundImage: NetworkImage(
                                              "http://192.168.3.53/assets/images/users/user0.jpg",
                                            ),
                                          ),
                                          expandedAlignment:
                                              Alignment.centerLeft,
                                          children: [
                                            context.emptySizedHeightBoxLow3x,
                                            Padding(
                                              padding: context
                                                  .horizontalPaddingNormal,
                                              child: Row(
                                                children: [
                                                  BoldText(
                                                    data: "Meslek: ",
                                                  ),
                                                  context.emptySizedWidthBoxLow,
                                                  Text(_viewModel.items
                                                          .worker?[index].job ??
                                                      "Ge??erli meslek bulunamad??."),
                                                ],
                                              ),
                                            ),
                                            const Divider(
                                              thickness: 2,
                                              indent: 15,
                                              endIndent: 15,
                                            ),
                                            context.emptySizedHeightBoxLow,
                                            Padding(
                                              padding: context
                                                  .horizontalPaddingNormal,
                                              child: Row(
                                                children: [
                                                  BoldText(
                                                    data: "Do??um Tarihi :",
                                                  ),
                                                  context.emptySizedWidthBoxLow,
                                                  Text(_viewModel
                                                          .items
                                                          .worker?[index]
                                                          .birthday ??
                                                      ""),
                                                ],
                                              ),
                                            ),
                                            const Divider(
                                              thickness: 2,
                                              indent: 15,
                                              endIndent: 15,
                                            ),
                                            context.emptySizedHeightBoxLow3x,
                                          ],
                                        ),
                                      ),
                                    ),
                                    const Divider(
                                      thickness: 2,
                                      height: 25,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                context.emptySizedHeightBoxLow3x,
              ],
            ),
          ),
        ),
      ),
    );
  }

  _showModalBottomSheet(context, double radius, List<Users>? users) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: context.dynamicHeight(0.7),
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
              context.emptySizedHeightBoxLow,
              Center(
                child: Container(
                  height: context.dynamicWidth(0.03),
                  width: context.dynamicWidth(0.2),
                  decoration: BoxDecoration(
                    borderRadius: context.lowBorderRadius,
                    color: Colors.grey,
                  ),
                ),
              ),
              context.emptySizedHeightBoxLow3x,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const BodyText1Copy(data: "??al????an Ekle"),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      backgroundColor: context.colorScheme.primaryVariant,
                      child: Icon(
                        Icons.close,
                        color: context.colorScheme.onSurface,
                      ),
                    ),
                  ),
                ],
              ),
              context.emptySizedHeightBoxLow3x,
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: users?.length ?? 0,
                  itemBuilder: (context, index) => Padding(
                      padding: context.paddingLow,
                      child: CheckBoxCardV2(
                        isSelect: users![index].isSelect,
                        data: users[index].full_name ?? "",
                        userId: users[index].id ?? "",
                      )),
                ),
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
                            data: "Vazge??",
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
                        List<String> userId =
                            ApplicationConstants.instance!.userId;
                        List<String> accesLevel =
                            ApplicationConstants.instance!.accessLevel;
                        Dio dio = Dio();
                        for (var i = 0;
                            i <
                                ApplicationConstants
                                    .instance!.accessLevel.length;
                            i++) {
                          await dio.post(
                              "http://192.168.3.53/api/Companys/new_access?token=$token&user_id=${userId[i]}&company_id=${_viewModel.items.id}&access=${accesLevel[i]}");
                          _viewModel.fetchItems(
                              token, _viewModel.items.id ?? "");
                          Navigator.of(context).pop();
                        }
                      },
                      child: Row(
                        children: [
                          Icon(Icons.add),
                          BodyText2Copy(
                              data: "Ekle",
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
}

class PopUpItemBody extends StatelessWidget {
  var nameController = TextEditingController();
  var mailController = TextEditingController();
  var phoneController = TextEditingController();
  var webSiteController = TextEditingController();
  var taxNumberController = TextEditingController();
  var taxDepartmentController = TextEditingController();
  var detailController = TextEditingController();
  var locationController = TextEditingController();

  final CompanyDetailViewModel viewModel;

  PopUpItemBody({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: context.paddingNormal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: CircleAvatar(
                  backgroundColor: context.colorScheme.primaryVariant,
                  child: Icon(
                    Icons.close,
                    color: context.colorScheme.onSurface,
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                  padding: context.paddingLow,
                  child: const BodyText1Copy(data: "Firma Ekle")),
            ),
            Padding(
              padding: context.paddingLow,
              child: const Text("Firma ??smi"),
            ),
            context.emptySizedHeightBoxLow,
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.business),
                hintText: 'Firma ismi giriniz.',
                labelText: 'Firma ismi',
                enabledBorder: OutlineInputBorder(
                  borderRadius: context.lowBorderRadius,
                  borderSide:
                      BorderSide(color: context.colorScheme.onBackground),
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
              child: const Text("Eposta Adresi"),
            ),
            context.emptySizedHeightBoxLow,
            TextField(
              controller: mailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.mail),
                hintText: 'Eposta adresi giriniz.',
                labelText: 'Eposta adresi',
                enabledBorder: OutlineInputBorder(
                  borderRadius: context.lowBorderRadius,
                  borderSide:
                      BorderSide(color: context.colorScheme.onBackground),
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
              child: const Text("Telefon"),
            ),
            context.emptySizedHeightBoxLow,
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.phone),
                hintText: 'Telefon numaras?? giriniz.',
                labelText: 'Telefon numaras??',
                enabledBorder: OutlineInputBorder(
                  borderRadius: context.lowBorderRadius,
                  borderSide:
                      BorderSide(color: context.colorScheme.onBackground),
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
              child: const Text("Web Sayfan??z"),
            ),
            context.emptySizedHeightBoxLow,
            TextField(
              controller: webSiteController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.public),
                hintText: 'Web sayfan??z?? giriniz.',
                labelText: 'Web sayfas??',
                enabledBorder: OutlineInputBorder(
                  borderRadius: context.lowBorderRadius,
                  borderSide:
                      BorderSide(color: context.colorScheme.onBackground),
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
              child: const Text("Vergi Numaras??"),
            ),
            context.emptySizedHeightBoxLow,
            TextField(
              controller: taxNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.tag),
                hintText: 'Veri numaras?? giriniz.',
                labelText: 'Vergi numaras??',
                enabledBorder: OutlineInputBorder(
                  borderRadius: context.lowBorderRadius,
                  borderSide:
                      BorderSide(color: context.colorScheme.onBackground),
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
              child: const Text("Vergi Dairesi"),
            ),
            context.emptySizedHeightBoxLow,
            TextField(
              controller: taxDepartmentController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.store),
                hintText: 'Veri dairesi giriniz.',
                labelText: 'Vergi dairesi',
                enabledBorder: OutlineInputBorder(
                  borderRadius: context.lowBorderRadius,
                  borderSide:
                      BorderSide(color: context.colorScheme.onBackground),
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
            context.emptySizedHeightBoxLow,
            TextField(
              controller: detailController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.description),
                hintText: 'Detay giriniz.',
                labelText: 'Detay',
                enabledBorder: OutlineInputBorder(
                  borderRadius: context.lowBorderRadius,
                  borderSide:
                      BorderSide(color: context.colorScheme.onBackground),
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
              child: const Text("Konum"),
            ),
            context.emptySizedHeightBoxLow,
            TextField(
              controller: locationController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.location_on),
                hintText: 'Konum giriniz.',
                labelText: 'Konum',
                enabledBorder: OutlineInputBorder(
                  borderRadius: context.lowBorderRadius,
                  borderSide:
                      BorderSide(color: context.colorScheme.onBackground),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: context.lowBorderRadius,
                  borderSide: BorderSide(color: context.colorScheme.surface),
                ),
              ),
              cursorColor: context.colorScheme.onSecondary,
            ),
            context.emptySizedHeightBoxLow3x,
            Divider(
              color: context.colorScheme.secondaryVariant,
              thickness: 0.4,
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
                    child: BodyText2Copy(
                        data: "Vazge??", color: context.colorScheme.onSurface),
                    style: ElevatedButton.styleFrom(
                        primary: context.colorScheme.secondaryVariant),
                  ),
                  context.emptySizedWidthBoxLow,
                  ElevatedButton(
                    onPressed: () async {
                      debugPrint(viewModel.items.id);
                      String token = ApplicationConstants.instance!.token;
                      Dio dio = Dio();
                      await dio.post(
                          "http://192.168.3.53/api/Companys/update_company?token=$token&id=${viewModel.items.id}&name=${nameController.text}&email=${mailController.text}&telephone=${phoneController.text}&web_site=${webSiteController.text}&tax_number=${taxNumberController.text}&tax_department=${taxDepartmentController.text}&detail=${detailController.text}&location=${locationController.text}");
                      viewModel.fetchItems(token, viewModel.items.id ?? "0");
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: context.colorScheme.secondaryVariant,
                          duration: context.durationSlow,
                          content: BodyText2Copy(
                            data: "Firma bilgileri ba??ar??yla g??ncellendi !",
                            color: context.colorScheme.onSurface,
                          ),
                        ),
                      );
                    },
                    child: BodyText2Copy(
                        data: "Kaydet", color: context.colorScheme.onSurface),
                    style: ElevatedButton.styleFrom(
                        primary: context.colorScheme.surface),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
