import '../../view/mail_view.dart';

import 'package:flutter/material.dart';

class PostponedView extends StatelessWidget {
  const PostponedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MailView(content: "ertelenmiş mail");
  }
}
