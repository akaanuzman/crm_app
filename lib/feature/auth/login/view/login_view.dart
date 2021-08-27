import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/components/text/body_text1_copy.dart';
import '../../../../core/components/text/body_text2_copy.dart';
import '../../../home/bottomtab/view/bottomtab_view.dart';
import '../../reset_pass/view/reset_pass_view.dart';
import '../viewmodel/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

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
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: context.paddingNormal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network("http://192.168.3.53/assets/images/logo-dark.png"),
            context.emptySizedHeightBoxNormal,
            Padding(
              padding: context.paddingLow,
              child: const Text("Email"),
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              decoration: InputDecoration(
                filled: true,
                prefixIcon: const Icon(Icons.email),
                hintText: 'Emaili giriniz.',
                labelText: "Email",
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
              obscureText: true,
              controller: passController,
              decoration: InputDecoration(
                filled: true,
                prefixIcon: const Icon(Icons.lock),
                hintText: 'Şifreyi giriniz.',
                labelText: "Şifre",
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
            context.emptySizedHeightBoxLow,
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: context.paddingLow,
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ResetPass()));
                      },
                      child: Text(
                        "Şifrenizi mi unuttunuz ?",
                        style: TextStyle(
                            color: context.colorScheme.surface,
                            fontWeight: FontWeight.bold),
                      )),
                )),
            context.emptySizedHeightBoxLow3x,
            SizedBox(
              width: double.infinity,
              height: context.dynamicHeight(0.065),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: context.highBorderRadius)),
                onPressed: () {
                  if (_viewModel.item?[1] != null) {
                    if (_viewModel.item![1] == 'success') {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BottomTabView()));
                      CoolAlert.show(
                        context: context,
                        type: CoolAlertType.success,
                        title: "",
                        text:
                            'Doğru kullanıcı adı ve şifre !\n Sisteme başarıyla giriş yapıldı.',
                        confirmBtnText: "Tamam",
                        loopAnimation: false,
                        confirmBtnColor: context.colorScheme.onPrimary,
                      );
                      // _showDialog(
                      //     context,
                      //     context.lowValue,
                      //     "Doğru kullanıcı adı ve şifre !",
                      //     "Sisteme başarıyla giriş yapıldı.");
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
                      _showDialog(
                          context,
                          context.lowValue,
                          "Yanlış kullanıcı adı veya şifre.",
                          "Lütfen tekrar giriş yapmayı deneyiniz.");
                    } else if (_viewModel.item![1] == 'null error') {
                      _showDialog(
                          context,
                          context.lowValue,
                          "Girilmeyen kullanıcı adı veya şifre",
                          "Lütfen tekrar giriş yapmayı deneyiniz.");
                    }
                  } else {
                    _viewModel.fetchItems(
                        emailController.text, passController.text);
                  }
                },
                child: BodyText2Copy(
                    data: "Giriş", color: context.colorScheme.onSurface),
              ),
            ),
            context.emptySizedHeightBoxLow3x,
            SizedBox(
              width: double.infinity,
              height: context.dynamicHeight(0.065),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: context.highBorderRadius),
                    primary: context.colorScheme.onError),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Scaffold()));
                },
                child: BodyText2Copy(
                    data: "Kayıt Ol", color: context.colorScheme.onSurface),
              ),
            )
          ],
        ),
      ),
    );
  }

  _showDialog(
      BuildContext context, double radius, String title, String content) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
              ),
              title: BodyText1Copy(
                data: title,
                color: context.colorScheme.onSecondary,
                fontWeight: FontWeight.bold,
              ),
              content: SizedBox(
                height: context.dynamicHeight(0.14),
                child: Column(
                  children: [
                    BodyText2Copy(data: content),
                    context.emptySizedHeightBoxLow,
                    Icon(
                      Icons.check_circle,
                      size: context.dynamicHeight(0.1),
                      color: context.colorScheme.onPrimary,
                    )
                  ],
                ),
              ),
              actions: [
                Padding(
                  padding: context.horizontalPaddingLow,
                  child: ElevatedButton(
                    child: Text("Tamam",
                        style: TextStyle(color: context.colorScheme.onSurface)),
                    style: ElevatedButton.styleFrom(
                        primary: context.colorScheme.onError),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ));
  }
}
