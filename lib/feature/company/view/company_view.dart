// ignore_for_file: must_be_immutable, duplicate_ignore

import 'package:crm_app/core/constants/app/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../viewmodel/company_view_model.dart';

import '../../../core/components/text/body_text1_copy.dart';
import '../../../core/components/text/body_text2_copy.dart';
import '../company_detail/view/company_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:popup_card/popup_card.dart';

// ignore: must_be_immutable
class CompanyView extends StatelessWidget {
  final CompanyViewModel _viewModel = CompanyViewModel();
  CompanyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Firmalar",
          style: TextStyle(color: context.colorScheme.onSecondary),
        ),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      floatingActionButton: PopupItemLauncher(
        tag: 'Proje Ekle',
        child: Material(
          color: context.colorScheme.onError,
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: context.highBorderRadius),
          child: Icon(
            Icons.add_rounded,
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
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      body: Observer(
        builder: (context) => Padding(
          padding: context.paddingLow,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: _viewModel.items.company?.length ?? 0,
            itemBuilder: (context, index) => Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: context.normalBorderRadius),
                  elevation: 5,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CompanyDetailView(
                                id: _viewModel.items.company?[index].id ?? "",
                              )));
                    },
                    child: ExpansionTile(
                      title: BodyText2Copy(
                          data: _viewModel.items.company?[index].name ??
                              "Geçerli firma adı bulunamadı."),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            _viewModel.items.company?[index].photo ??
                                "http://192.168.3.53/assets/images/companies/company.png"),
                        backgroundColor: context.colorScheme.onSurface,
                      ),
                      expandedAlignment: Alignment.centerLeft,
                      children: [
                        context.emptySizedHeightBoxLow,
                        Padding(
                          padding: context.horizontalPaddingNormal,
                          child: Row(
                            children: [
                              Text(
                                "Email",
                                style: TextStyle(
                                    color: context.colorScheme.onBackground),
                              ),
                              context.emptySizedWidthBoxLow3x,
                              Text(_viewModel.items.company?[index].email ??
                                  "Geçerli email adresi bulunamadı."),
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
                              Text(
                                "Telefon",
                                style: TextStyle(
                                    color: context.colorScheme.onBackground),
                              ),
                              context.emptySizedWidthBoxLow3x,
                              Text(_viewModel.items.company?[index].telephone ??
                                  "Geçerli telefon numarası bulunamadı."),
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
                              Text(
                                "Webiste",
                                style: TextStyle(
                                    color: context.colorScheme.onBackground),
                              ),
                              context.emptySizedWidthBoxLow3x,
                              Text(_viewModel.items.company?[index].web_site ??
                                  "Geçerli web sitesi bulunamadı."),
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
                              Text(
                                "Konum",
                                style: TextStyle(
                                    color: context.colorScheme.onBackground),
                              ),
                              context.emptySizedWidthBoxLow3x,
                              Text(_viewModel.items.company?[index].location ??
                                  "Geçerli konum bilgisi bulunamadı."),
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
                context.emptySizedHeightBoxLow,
              ],
            ),
          ),
        ),
      ),
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
  final CompanyViewModel viewModel;

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
              child: const Text("Firma İsmi"),
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
                hintText: 'Telefon numarası giriniz.',
                labelText: 'Telefon numarası',
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
              child: const Text("Web Sayfanız"),
            ),
            context.emptySizedHeightBoxLow,
            TextField(
              controller: webSiteController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.public),
                hintText: 'Web sayfanızı giriniz.',
                labelText: 'Web sayfası',
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
              child: const Text("Vergi Numarası"),
            ),
            context.emptySizedHeightBoxLow,
            TextField(
              controller: taxNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.tag),
                hintText: 'Veri numarası giriniz.',
                labelText: 'Vergi numarası',
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
                        data: "Vazgeç", color: context.colorScheme.onSurface),
                    style: ElevatedButton.styleFrom(
                        primary: context.colorScheme.secondaryVariant),
                  ),
                  context.emptySizedWidthBoxLow,
                  ElevatedButton(
                    onPressed: () async {
                      String token = ApplicationConstants.instance!.token;
                      Dio dio = Dio();
                      await dio.post(
                          "http://192.168.3.53/api/Companys/new_company?token=$token&name=${nameController.text}&email=${mailController.text}&telephone=${phoneController.text}&web_site=${webSiteController.text}&tax_number=${taxNumberController.text}&tax_department=${taxDepartmentController.text}&detail=${detailController.text}&location=${locationController.text}");
                      viewModel.fetchItems(token);
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: context.colorScheme.secondaryVariant,
                          duration: context.durationSlow,
                          content: BodyText2Copy(
                            data: "Firma başarıyla eklendi !",
                            color: context.colorScheme.onSurface,
                          ),
                        ),
                      );
                    },
                    child: BodyText2Copy(
                        data: "Ekle", color: context.colorScheme.onSurface),
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
