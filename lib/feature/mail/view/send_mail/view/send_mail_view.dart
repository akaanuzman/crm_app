import 'package:crm_app/core/constants/app/app_constants.dart';
import 'package:crm_app/feature/contact/viewmodel/contact_view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../core/components/text/body_text1_copy.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class SendMailView extends StatefulWidget {
  const SendMailView({Key? key}) : super(key: key);

  @override
  State<SendMailView> createState() => _SendMailViewState();
}

class _SendMailViewState extends State<SendMailView> {
  final ContactViewModel _viewModel = ContactViewModel();
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    _viewModel.fetchItems(ApplicationConstants.instance!.token);
    return Scaffold(
      appBar: AppBar(
        title: Image.network(
          "http://192.168.3.53/assets/images/logo-light.png",
          width: context.dynamicWidth(0.28),
        ),
        centerTitle: true,
      ),
      body: Observer(
        builder: (context) => SingleChildScrollView(
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
                                  child:
                                      const BodyText1Copy(data: "Kişilerim")),
                            ),
                            context.emptySizedHeightBoxLow,
                            Expanded(
                              child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: _viewModel.items.users?.length ?? 0,
                                itemBuilder: (context, index) =>  Observer(
                                  builder:(context) =>  Card(
                                      elevation: 5,
                                      child: CheckboxListTile(
                                        value: _viewModel.items.users?[index].isChanged,
                                        onChanged: (value) {
                                          debugPrint(_viewModel.items.users?[index].isChanged.toString());
                                          _viewModel.items.users?[index].isChanged = value!;
                                        },
                                        title: Text(_viewModel.items.users?[index].full_name ?? "Geçerli isim bulunamadı."),
                                      ),
                                    ),
                                ),
                                
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
                                      data: "Kayıtlı olmayan eposta ekle")),
                            ),
                            context.emptySizedHeightBoxLow,
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Kişinin adi soyadini giriniz.',
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
                            context.emptySizedHeightBoxLow3x,
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Kişinin emailini giriniz.',
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
                            context.emptySizedHeightBoxLow,
                            Center(
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "Kişilerime Ekle",
                                  style: TextStyle(
                                      color: context.colorScheme.onSurface),
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
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Kişinin adi soyadini giriniz.',
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
                            context.emptySizedHeightBoxLow,
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'İçerik',
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
                              maxLines: 16,
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
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Eposta Gönder",
                        style: TextStyle(color: context.colorScheme.onSurface),
                      ),
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
