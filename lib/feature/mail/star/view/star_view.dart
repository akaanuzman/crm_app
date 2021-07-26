import 'package:crm_app/feature/mail/model/mail_model.dart';
import 'package:flutter/material.dart';

class StarView extends StatelessWidget {
  const StarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MailModel(content: "yıldızlı mail");
  }
}
