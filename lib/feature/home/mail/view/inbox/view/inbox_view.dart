import '../../../../../../core/constants/app/app_constants.dart';
import 'package:flutter/material.dart';

import '../../../viewmodel/mail_view_model.dart';
import '../../mail_view.dart';

class InboxView extends StatelessWidget {
  final MailViewModel viewModel = MailViewModel();
  InboxView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    viewModel.fetchItems(ApplicationConstants.instance!.token, "is_active");
    return MailView(
      title: "Gelen Kutusu",
      viewModel: viewModel,
    );
  }
}
