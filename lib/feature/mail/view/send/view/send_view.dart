import 'package:flutter/material.dart';

import '../../mail_view.dart';


class SendView extends StatelessWidget {
  const SendView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MailView(content: "gönderilen mail");
  }
}
