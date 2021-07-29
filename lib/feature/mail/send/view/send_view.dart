import '../../model/mail_model.dart';
import 'package:flutter/material.dart';

class SendView extends StatelessWidget {
  const SendView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MailModel(content: "gönderilen mail");
  }
}
