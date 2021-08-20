import 'package:dio/dio.dart';

import '../../../../../core/constants/app/app_constants.dart';
import '../../../../contact/viewmodel/contact_view_model.dart';
import '../../../../../product/widgets/card/check_box_card.dart';
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
  List<String> names = [];

  @override
  Widget build(BuildContext context) {
    void setNameAndGetLenght() {
      for (var i = 0; i < _viewModel.items.users!.length; i++) {
        names.add(_viewModel.items.users![i].full_name ?? "");
      }
      for (var i = 0; i < _viewModel.items.guides!.length; i++) {
        names.add(_viewModel.items.guides![i].name ?? "");
      }

      for (var i = 0; i < names.length; i++) {
        debugPrint(names[i]);
      }
    }

    _viewModel.fetchItems(ApplicationConstants.instance!.token);

    var titleController = TextEditingController();
    var contentController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Image.network(
          "http://192.168.3.53/assets/images/logo-light.png",
          width: context.dynamicWidth(0.28),
        ),
        centerTitle: true,
      ),
      body: Observer(
        builder: (context) {
          //setNameAndGetLenght();
          return SingleChildScrollView(
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
                                  itemCount:
                                      _viewModel.items.users?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    return CheckBoxCard(
                                        isSelect: _viewModel
                                            .items.users![index].isSelect,
                                        data: _viewModel.items.users?[index]
                                                .full_name ??
                                            "");
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
                                        data: "Kayıtlı olmayan eposta ekle")),
                              ),
                              context.emptySizedHeightBoxLow,
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'Kişinin adi soyadini giriniz.',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: context.lowBorderRadius,
                                    borderSide: BorderSide(
                                        color:
                                            context.colorScheme.onBackground),
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
                                        color:
                                            context.colorScheme.onBackground),
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
                              context.emptySizedHeightBoxLow,
                              TextField(
                                controller: titleController,
                                decoration: InputDecoration(
                                  hintText: 'Mailin başlığını giriniz.',
                                  labelText: "Başlık",
                                  prefixIcon: const Icon(Icons.title),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: context.lowBorderRadius,
                                    borderSide: BorderSide(
                                        color:
                                            context.colorScheme.onBackground),
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
                                controller: contentController,
                                decoration: InputDecoration(
                                  hintText: 'İçerik',
                                  labelText: "Mail içeriğini giriniz.",
                                  prefixIcon: const Icon(Icons.content_paste),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: context.lowBorderRadius,
                                    borderSide: BorderSide(
                                        color:
                                            context.colorScheme.onBackground),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: context.lowBorderRadius,
                                    borderSide: BorderSide(
                                        color: context.colorScheme.surface),
                                  ),
                                ),
                                cursorColor: context.colorScheme.onSecondary,
                                maxLines: 15,
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
                        onPressed: () {
                          int id = 0;
                          for (var i = 0; i < _viewModel.items.users!.length; i++) {
                            bool select = _viewModel.items.users![i].isSelect;
                            if (select) {
                              id = int.parse(_viewModel.items.userid ?? "0");
                            }
                          }
                          Dio dio = Dio();
                          dio.post("http://192.168.3.53/api/Email/send_email?user_id=u$id&token=${ApplicationConstants.instance!.token}&title=${titleController.text}&content=${contentController.text}");
                        },
                        child: Text(
                          "Eposta Gönder",
                          style:
                              TextStyle(color: context.colorScheme.onSurface),
                        ),
                      ),
                    ),
                  ),
                  context.emptySizedHeightBoxLow,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
