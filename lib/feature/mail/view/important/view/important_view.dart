import 'package:flutter/material.dart';

import '../../../../../core/constants/app/app_constants.dart';
import '../../../viewmodel/mail_view_model.dart';
import '../../mail_view.dart';

class ImportantView extends StatelessWidget {
  final MailViewModel viewModel = MailViewModel();
  ImportantView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    viewModel.fetchItems(ApplicationConstants.instance!.token, "important");
    return MailView(
      title: "Önemli Mailler",
      viewModel: viewModel,
    );
  }
}
