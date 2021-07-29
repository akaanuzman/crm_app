import '../../model/mail_model.dart';
import 'package:flutter/material.dart';

class DraftView extends StatelessWidget {
  const DraftView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MailModel(content: "taslak mail");
  }
}
