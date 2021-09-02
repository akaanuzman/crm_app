import 'package:flutter/material.dart';

import '../../../../../../core/constants/app/app_constants.dart';
import '../../../viewmodel/mail_view_model.dart';
import '../../mail_view.dart';

class StarView extends StatelessWidget {
  final MailViewModel viewModel = MailViewModel();
  StarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    viewModel.fetchItems(ApplicationConstants.instance!.token, "starred");
    return MailView(
      title: "Yıldızlı Mailler",
      viewModel: viewModel,
    );
  }
}
