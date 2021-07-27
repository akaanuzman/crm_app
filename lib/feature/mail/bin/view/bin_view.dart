import '../../model/mail_model.dart';
import 'package:flutter/material.dart';

class BinView extends StatelessWidget {
  const BinView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MailModel(content: "çöp mail");
  }
}
