import 'package:flutter/material.dart';

import '../../model/contact_model.dart';

class MyContactsView extends StatelessWidget {
  const MyContactsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ContactModel(name: "test", email: "test_mycontact@gmail.com");
  }
}
