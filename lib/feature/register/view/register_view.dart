import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stepper(steps: _stepper()),
    );
  }

  List<Step> _stepper() {
    List<Step> _steps = [
      Step(
        title: Text("Eposta adresiniz"),
        content: Padding(
          padding: context.verticalPaddingLow,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              filled: true,
              prefixIcon: const Icon(Icons.email),
              hintText: 'Emaili giriniz.',
              labelText: "Email",
              enabledBorder: OutlineInputBorder(
                borderRadius: context.lowBorderRadius,
                borderSide: BorderSide(color: context.colorScheme.onBackground),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: context.lowBorderRadius,
                borderSide: BorderSide(color: context.colorScheme.surface),
              ),
            ),
            cursorColor: context.colorScheme.onSecondary,
          ),
        ),
      )
    ];
    return _steps;
  }
}
