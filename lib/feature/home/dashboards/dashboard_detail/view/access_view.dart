// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:crm_app/core/constants/app/app_constants.dart';
import 'package:crm_app/feature/home/contact/viewmodel/contact_view_model.dart';
import 'package:crm_app/feature/home/dashboards/dashboard_detail/viewmodel/acces_view_model.dart';
import 'package:crm_app/product/widgets/card/check_box_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';

class AccesView extends StatefulWidget {
  final AccessViewModel _viewModel = AccessViewModel();
  final ContactViewModel _contactViewModel = ContactViewModel();

  AccesView({Key? key}) : super(key: key);

  @override
  State<AccesView> createState() => _AccesViewState();
}

class _AccesViewState extends State<AccesView> {
  late final AccessViewModel _viewModel;
  late final ContactViewModel _contactViewModel;
  String dropdownValue = 'Yorum Atabilir';
  String token = ApplicationConstants.instance!.token;

  @override
  void initState() {
    super.initState();
    _viewModel = widget._viewModel;
    _contactViewModel = widget._contactViewModel;
    _contactViewModel.fetchItems(token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Erişim Sahipleri"),
      ),
      body: Observer(
        builder: (_) => Column(
          children: [
            Padding(
              padding: context.paddingLow,
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: context.lowBorderRadius),
                child: Padding(
                  padding: context.paddingNormal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(_viewModel.isSwitch
                              ? "Paylaşım açık"
                              : "Paylaşılabilir link al"),
                          Row(
                            children: [
                              Switch(
                                value: _viewModel.isSwitch,
                                onChanged: (value) => _viewModel.changeSwitch(),
                              ),
                              Text(_viewModel.isSwitch ? "Aktif" : "Pasif")
                            ],
                          ),
                        ],
                      ),
                      AnimatedOpacity(
                        opacity: _viewModel.isSwitch ? 1.0 : 0.0,
                        duration: context.durationLow,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text("Erişim:"),
                                context.emptySizedWidthBoxLow3x,
                                DropdownButton<String>(
                                  value: dropdownValue,
                                  onChanged: (String? newValue) {
                                    setState(() => dropdownValue = newValue!);
                                  },
                                  items: <String>[
                                    'Yorum Atabilir',
                                    'Görüntüleyebilir',
                                    'Düzenleyebilir',
                                    'Paylaşabilir',
                                    'Tam Erişim',
                                    'Erişimi Kaldır'
                                  ].map<DropdownMenuItem<String>>(
                                    (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    },
                                  ).toList(),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Paylaş:"),
                                context.emptySizedWidthBoxLow,
                                IconButton(
                                    onPressed: () {}, icon: Icon(Icons.share))
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: _contactViewModel.items.users?.length ?? 0,
                  itemBuilder: (context, index) => index <
                          _contactViewModel.items.users!.length
                      ? CheckBoxCard(
                          isSelect:
                              _contactViewModel.items.users![index].isSelect,
                          data:
                              _contactViewModel.items.users?[index].full_name ??
                                  "",
                          userId:
                              _contactViewModel.items.users?[index].id ?? "0",
                        )
                      : const SizedBox(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
