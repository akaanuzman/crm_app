import '../../view/mail_view.dart';

import 'package:flutter/material.dart';

class SpamView extends StatelessWidget {
  const SpamView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MailView(content: "spam mail");
  }
}
