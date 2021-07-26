import 'package:crm_app/feature/mail/model/mail_model.dart';
import 'package:flutter/material.dart';

class PostponedView extends StatelessWidget {
  const PostponedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MailModel(content: "ertelenmiş mail");
  }
}
