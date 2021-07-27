import '../../model/contact_model.dart';

import 'package:flutter/material.dart';

class MyCustomersView extends StatelessWidget {
  const MyCustomersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ContactModel(
        name: "test müsteri", email: "test_musteri@hotmail.com");
  }
}
