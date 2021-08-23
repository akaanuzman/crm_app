import '../../../../../core/constants/app/app_constants.dart';
import '../../../viewmodel/mail_view_model.dart';
import 'package:flutter/material.dart';

import '../../mail_view.dart';

class BinView extends StatelessWidget {
  final MailViewModel viewModel = MailViewModel();
  BinView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    viewModel.fetchItems(ApplicationConstants.instance!.token, "trash");
    return MailView(
      title: "Çöp Kutusu",
      viewModel: viewModel,
    );
  }
}
