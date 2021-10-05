import 'package:flutter/material.dart';

import '../../../../../../core/constants/app/app_constants.dart';
import '../../../viewmodel/mail_view_model.dart';
import '../../mail_view.dart';

class DraftView extends StatelessWidget {
  final MailViewModel viewModel = MailViewModel();
  DraftView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    viewModel.fetchItems(ApplicationConstants.instance!.token, "draft");
    return MailView(
      title: "Taslak Mailler",
      viewModel: viewModel,
    );
  }
}
