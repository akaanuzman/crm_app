import 'package:crm_app/feature/contact/model/contact_model.dart';

import 'package:flutter/material.dart';

class MyColleaguesView extends StatelessWidget {
  const MyColleaguesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ContactModel(name: "test is", email: "test_is@hotmail.com");
  }
}
