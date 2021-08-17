import '../../mail_view.dart';

import 'package:flutter/material.dart';

class ImportantView extends StatelessWidget {
  const ImportantView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MailView(content: "önemli mail");
  }
}
