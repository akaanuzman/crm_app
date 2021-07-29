import 'package:flutter/material.dart';

import '../../model/mail_model.dart';

class IncomingView extends StatelessWidget {
  const IncomingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MailModel(content: "gelen mail");
  }
}
