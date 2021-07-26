import 'package:crm_app/feature/contact/model/contact_model.dart';

import 'package:flutter/material.dart';

class MyFriendsView extends StatelessWidget {
  const MyFriendsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ContactModel(
        name: "test arkadas", email: "test_arkadas@hotmail.com");
  }
}
