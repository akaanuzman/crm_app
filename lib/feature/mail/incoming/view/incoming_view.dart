import 'package:flutter/material.dart';

import '../../view/mail_view.dart';


class IncomingView extends StatelessWidget {
  const IncomingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MailView(content: "gelen mail");
  }
}
