// ignore_for_file: prefer_const_constructors

import 'package:cool_alert/cool_alert.dart';
import 'package:crm_app/core/init/theme/light/color_scheme_light.dart';
import 'package:crm_app/feature/auth/register/view/register_view.dart';
import '../../../../core/cache/cache_manager.dart';
import '../../../../core/constants/app/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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

class _LoginViewState extends State<LoginView> with CacheManager {
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
                  borderSide: BorderSide(color: Colors.grey),
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
              child: const Text("??ifre"),
            ),
            TextField(
              obscureText: true,
              controller: passController,
              decoration: InputDecoration(
                filled: true,
                prefixIcon: const Icon(Icons.lock),
                hintText: '??ifreyi giriniz.',
                labelText: "??ifre",
                enabledBorder: OutlineInputBorder(
                  borderRadius: context.lowBorderRadius,
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: context.lowBorderRadius,
                  borderSide: BorderSide(color: context.colorScheme.surface),
                ),
              ),
              cursorColor: context.colorScheme.onSecondary,
            ),
            context.emptySizedHeightBoxLow,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                        "??ifrenizi mi unuttunuz ?",
                        style: TextStyle(
                            color: context.colorScheme.surface,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Observer(
                      builder: (_) => Checkbox(
                          activeColor: context.colorScheme.secondaryVariant,
                          value: _viewModel.isRememberMe,
                          onChanged: (value) => _viewModel.changeRememberMe()),
                    ),
                    Text(
                      "Beni hat??rla",
                      style: TextStyle(
                          color: context.colorScheme.secondaryVariant,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            context.emptySizedHeightBoxLow3x,
            SizedBox(
              width: double.infinity,
              height: context.dynamicHeight(0.065),
              child: ElevatedButton(
                onPressed: () {
                  if (_viewModel.item?[1] != null) {
                    if (_viewModel.item![1] == 'success') {
                      if (_viewModel.isRememberMe) {
                        saveToken(
                            token: _viewModel.item?[0] ??
                                ApplicationConstants.instance!.token);
                      }
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BottomTabView()));
                      CoolAlert.show(
                        context: context,
                        type: CoolAlertType.success,
                        title: "",
                        text:
                            'Do??ru kullan??c?? ad?? ve ??ifre !\n Sisteme ba??ar??yla giri?? yap??ld??.',
                        confirmBtnText: "Tamam",
                        loopAnimation: false,
                        confirmBtnColor: context.colorScheme.onPrimary,
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: context.colorScheme.secondaryVariant,
                          duration: context.durationSlow,
                          content: BodyText2Copy(
                            data: "Giri?? ba??ar??l?? !",
                            color: context.colorScheme.onSurface,
                          ),
                        ),
                      );
                    } else if (_viewModel.item![1] == 'error') {
                      _showDialog(
                          context,
                          context.lowValue,
                          "Yanl???? kullan??c?? ad?? veya ??ifre.",
                          "L??tfen tekrar giri?? yapmay?? deneyiniz.");
                    } else if (_viewModel.item![1] == 'null error') {
                      _showDialog(
                          context,
                          context.lowValue,
                          "Girilmeyen kullan??c?? ad?? veya ??ifre",
                          "L??tfen tekrar giri?? yapmay?? deneyiniz.");
                    }
                  } else {
                    _viewModel.fetchItems(
                        emailController.text, passController.text);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.login,
                      color: context.colorScheme.surface,
                    ),
                    context.emptySizedWidthBoxLow,
                    BodyText2Copy(
                      data: "Giri??",
                      color: context.colorScheme.surface,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered)) {
                        return context.colorScheme.surface.withOpacity(0.2);
                      }
                      if (states.contains(MaterialState.focused) ||
                          states.contains(MaterialState.pressed)) {
                        return context.colorScheme.surface.withOpacity(0.2);
                      }
                      return Colors.red; // Defer to the widget's default.
                    },
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xffe8f4f8)),
                ),
              ),
            ),
            context.emptySizedHeightBoxLow3x,
            SizedBox(
              width: double.infinity,
              height: context.dynamicHeight(0.065),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => RegisterView()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.how_to_reg,
                        color: context.colorScheme.background),
                    context.emptySizedWidthBoxLow,
                    BodyText2Copy(
                      data: "Kay??t Ol",
                      color: context.colorScheme.background,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered)) {
                        return context.colorScheme.background.withOpacity(0.2);
                      }
                      if (states.contains(MaterialState.focused) ||
                          states.contains(MaterialState.pressed)) {
                        return context.colorScheme.background.withOpacity(0.2);
                      }
                      return Colors.red; // Defer to the widget's default.
                    },
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      ColorSchemeLight.instance.pippin),
                ),
              ),
            ),
            context.emptySizedHeightBoxLow,
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
