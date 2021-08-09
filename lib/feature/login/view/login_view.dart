import 'package:crm_app/core/components/text/body_text1_copy.dart';
import 'package:crm_app/core/components/text/body_text2_copy.dart';
import 'package:crm_app/feature/bottomtab/view/bottomtab_view.dart';
import 'package:crm_app/feature/login/viewmodel/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel _viewModel = LoginViewModel();

  var emailController = TextEditingController();

  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (_viewModel.context == null) {
      _viewModel.setContext(context);
    }
    return Scaffold(
      body: Padding(
        padding: context.paddingNormal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: context.paddingLow,
              child: const Text("Email"),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Emaili giriniz.',
                enabledBorder: OutlineInputBorder(
                  borderRadius: context.lowBorderRadius,
                  borderSide:
                      BorderSide(color: context.colorScheme.onBackground),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: context.lowBorderRadius,
                  borderSide: BorderSide(color: context.colorScheme.surface),
                ),
              ),
              cursorColor: context.colorScheme.onSecondary,
            ),
            context.emptySizedHeightBoxLow3x,
            Padding(
              padding: context.paddingLow,
              child: const Text("Şifre"),
            ),
            TextField(
              controller: passController,
              decoration: InputDecoration(
                hintText: 'Şifreyi giriniz.',
                enabledBorder: OutlineInputBorder(
                  borderRadius: context.lowBorderRadius,
                  borderSide:
                      BorderSide(color: context.colorScheme.onBackground),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: context.lowBorderRadius,
                  borderSide: BorderSide(color: context.colorScheme.surface),
                ),
              ),
              cursorColor: context.colorScheme.onSecondary,
            ),
            context.emptySizedHeightBoxLow3x,
            ElevatedButton(
              onPressed: () {
                _viewModel.fetchItems(
                    emailController.text, passController.text);
                //debugPrint(_viewModel.item![0]);
                if (_viewModel.item![1] == 'success') {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => BottomTabView()));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: context.colorScheme.secondaryVariant,
                      duration: context.durationSlow,
                      content: BodyText2Copy(
                        data: "Giriş başarılı !",
                        color: context.colorScheme.onSurface,
                      ),
                    ),
                  );
                } else if (_viewModel.item![1] == 'error') {
                  _showDialog(context, context.lowValue,
                      "Yanlış kullanıcı adı veya şifre.");
                } else if (_viewModel.item![1] == 'null error') {
                  _showDialog(context, context.lowValue,
                      "Girilmeyen kullanıcı adı veya şifre");
                }
              },
              child: BodyText2Copy(
                  data: "Giriş Yap", color: context.colorScheme.onSurface),
              style: ElevatedButton.styleFrom(
                  primary: context.colorScheme.surface),
            )
          ],
        ),
      ),
    );
  }

  _showDialog(BuildContext context, double radius, String title) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
              ),
              title: BodyText1Copy(data: title),
              content: const BodyText2Copy(
                  data: "Lütfen tekrar giriş yapmayı deneyiniz."),
              actions: [
                ElevatedButton(
                  child: Text("Tamam",
                      style: TextStyle(color: context.colorScheme.onSurface)),
                  style: ElevatedButton.styleFrom(
                      primary: context.colorScheme.primaryVariant),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
  }
}
