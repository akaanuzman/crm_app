import '../../view/mail_view.dart';

import 'package:flutter/material.dart';

class DraftView extends StatelessWidget {
  const DraftView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MailView(content: "taslak mail");
  }
}
