import 'package:flutter/material.dart';

import '../../mail_view.dart';

class DraftView extends StatelessWidget {
  const DraftView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MailView(content: "taslak mail");
  }
}
