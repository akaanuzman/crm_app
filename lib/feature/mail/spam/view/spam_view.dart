import '../../model/mail_model.dart';
import 'package:flutter/material.dart';

class SpamView extends StatelessWidget {
  const SpamView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MailModel(content: "spam mail");
  }
}
