import '../../view/mail_view.dart';
import 'package:flutter/material.dart';


class IncomingView extends StatelessWidget {
  const IncomingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MailView(content: "gelen mail");
  }
}
