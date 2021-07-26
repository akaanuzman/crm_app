import 'package:crm_app/feature/contact/model/contact_model.dart';

import 'package:flutter/material.dart';

class MyContactsView extends StatelessWidget {
  const MyContactsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ContactModel(name: "test", email: "test_mycontact@gmail.com");
  }
}
