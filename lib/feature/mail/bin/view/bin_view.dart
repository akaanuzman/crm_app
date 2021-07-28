import 'package:flutter/material.dart';

import '../../model/mail_model.dart';

class BinView extends StatelessWidget {
  const BinView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MailModel(content: "çöp mail");
  }
}
