import '../../../../../core/constants/app/app_constants.dart';
import '../../../viewmodel/mail_view_model.dart';
import 'package:flutter/material.dart';

import '../../mail_view.dart';

class PostponedView extends StatelessWidget {
  final MailViewModel viewModel = MailViewModel();
  PostponedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    viewModel.fetchItems(ApplicationConstants.instance!.token, "snoozed");
    return MailView(
      viewModel: viewModel,
    );
  }
}
