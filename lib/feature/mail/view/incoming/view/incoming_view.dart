import '../../../../../core/constants/app/app_constants.dart';
import '../../../viewmodel/mail_view_model.dart';
import 'package:flutter/material.dart';

import '../../mail_view.dart';

class IncomingView extends StatelessWidget {
  final MailViewModel viewModel = MailViewModel();
  IncomingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    viewModel.fetchItems(ApplicationConstants.instance!.token, "");
    return MailView(
      title: "Gönderilen Mailler",
      viewModel: viewModel,
    );
  }
}
