import '../../../../../core/constants/app/app_constants.dart';
import '../../../viewmodel/mail_view_model.dart';

import '../../mail_view.dart';

import 'package:flutter/material.dart';

class SpamView extends StatelessWidget {
  final MailViewModel viewModel = MailViewModel();
   SpamView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    viewModel.fetchItems(ApplicationConstants.instance!.token,"spam");
    return MailView(viewModel: viewModel,);
  }
}
