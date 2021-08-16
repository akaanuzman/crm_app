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
          child: const PopUpItemBody(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      body: Observer(
        builder: (context) => Padding(
          padding: context.paddingLow,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: _viewModel.items.companys?.length ?? 0,
            // ignore: prefer_const_constructors
            itemBuilder: (context, index) => Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: context.normalBorderRadius),
                  elevation: 5,
                  // ignore: prefer_const_constructors
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>  CompanyDetailView(id: _viewModel.items.companys?[index].id ?? "",)));
                    },
                    child: ExpansionTile(
                      // ignore: prefer_const_constructors
                      title: BodyText2Copy(
                          data: _viewModel.items.companys?[index].name ?? "Geçerli firma adı bulunamadı."),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            _viewModel.items.companys?[index].photo ?? "Geçerli firma resmi bulunamadı."),
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
                              Text(_viewModel.items.companys?[index].email ??
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
                              Text(
                                  _viewModel.items.companys?[index].telephone ??
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
                              Text(_viewModel.items.companys?[index].web_site ??
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
                              Text(_viewModel.items.companys?[index].location ?? "Geçerli konum bilgisi bulunamadı."),
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
  const PopUpItemBody({
    Key? key,
  }) : super(key: key);

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
            TextField(
              decoration: InputDecoration(
                hintText: 'Firma ismi giriniz.',
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
            TextField(
              decoration: InputDecoration(
                hintText: 'Eposta adresi giriniz.',
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
            Padding(
              padding: context.paddingLow,
              child: const Text("Telefon"),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Telefon numarası giriniz.',
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
            Padding(
              padding: context.paddingLow,
              child: const Text("Web Sayfanız"),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Web sayfanızı giriniz.',
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
            Padding(
              padding: context.paddingLow,
              child: const Text("Adres"),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Adresinizi giriniz.',
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
                    onPressed: () {},
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
