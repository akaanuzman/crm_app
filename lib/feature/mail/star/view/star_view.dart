import '../../view/mail_view.dart';

import 'package:flutter/material.dart';

class StarView extends StatelessWidget {
  const StarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MailView(content: "yıldızlı mail");
  }
}
