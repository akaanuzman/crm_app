// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:cool_alert/cool_alert.dart';
import 'package:crm_app/core/components/text/body_text2_copy.dart';
import 'package:crm_app/feature/auth/login/view/login_view.dart';
import 'package:crm_app/feature/auth/reset_pass/viewmodel/reset_pass_view_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';

class ResetPass extends StatelessWidget {
  final ResetPassViewModel _viewModel = ResetPassViewModel();
  final _formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  String verificationCode = "";
  ResetPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.paddingNormal,
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Observer(
            builder: (context) => SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                height: context.dynamicHeight(1.2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                        child: Image.network(
                            "http://192.168.3.53/assets/images/logo-dark.png")),
                    context.emptySizedHeightBoxLow3x,
                    const Text("Şifrenizi mi unuttunuz ?"),
                    context.emptySizedHeightBoxNormal,
                    Padding(
                      padding: context.paddingLow,
                      child: const Text("Email"),
                    ),
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        suffixIcon: SizedBox(
                          height: context.dynamicHeight(0.07),
                          child: ElevatedButton(
                            onPressed: () async {
                              CoolAlert.show(
                                context: context,
                                type: CoolAlertType.info,
                                title: "",
                                text:
                                    'Şifre sıfırlama isteğiniz başarılı !\n Lütfen mail adresinize gelen doğrulama kodunu giriniz.',
                                confirmBtnText: "Tamam",
                                loopAnimation: false,
                                confirmBtnColor: context.colorScheme.onPrimary,
                              );
                              Dio dio = Dio();
                              final response = await dio.get(
                                  "http://192.168.3.53/api/Foreign/lost_key?email=${emailController.text}");
                              final mapVerificationCode =
                                  jsonDecode(response.data);
                              verificationCode =
                                  mapVerificationCode['dogrulama'].toString();
                              debugPrint(verificationCode);
                              _viewModel.openToClose();
                            },
                            child: Text(
                              "Doğrula",
                              style: TextStyle(
                                  color: context.colorScheme.onSurface),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: context.colorScheme.secondaryVariant),
                          ),
                        ),
                        filled: true,
                        prefixIcon: const Icon(Icons.email),
                        hintText: 'Emaili giriniz.',
                        labelText: "Email",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: context.lowBorderRadius,
                          borderSide: BorderSide(
                              color: context.colorScheme.onBackground),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: context.lowBorderRadius,
                          borderSide:
                              BorderSide(color: context.colorScheme.surface),
                        ),
                      ),
                      cursorColor: context.colorScheme.onSecondary,
                    ),
                    context.emptySizedHeightBoxLow3x,
                    AnimatedOpacity(
                      opacity: _viewModel.isOpen ? 1.0 : 0.0,
                      duration: context.durationLow,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _viewModel.closeToOpen();
                                }
                              },
                              icon: const Icon(Icons.next_plan)),
                          filled: true,
                          prefixIcon: const Icon(Icons.check_circle),
                          hintText: 'Doğrulama kodunu giriniz.',
                          labelText: "Doğrulama kodu",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: context.lowBorderRadius,
                            borderSide: BorderSide(
                                color: context.colorScheme.onBackground),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: context.lowBorderRadius,
                            borderSide:
                                BorderSide(color: context.colorScheme.surface),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: context.lowBorderRadius,
                            borderSide: const BorderSide(color: Colors.red),
                          ),
                        ),
                        cursorColor: context.colorScheme.onSecondary,
                        validator: (value) {
                          if (verificationCode != value) {
                            return 'Geçersiz doğrulama kodu !';
                          }
                        },
                      ),
                    ),
                    context.emptySizedHeightBoxLow3x,
                    AnimatedOpacity(
                      duration: context.durationLow,
                      opacity: _viewModel.isClose ? 0.0 : 1.0,
                      child: Padding(
                        padding: context.paddingLow,
                        child: const Text("Yeni Şifre"),
                      ),
                    ),
                    AnimatedOpacity(
                      duration: context.durationLow,
                      opacity: _viewModel.isClose ? 0.0 : 1.0,
                      child: TextField(
                        controller: passController,
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          prefixIcon: const Icon(Icons.lock),
                          hintText: 'Yeni şifrenizi giriniz.',
                          labelText: "Yeni şifre",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: context.lowBorderRadius,
                            borderSide: BorderSide(
                                color: context.colorScheme.onBackground),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: context.lowBorderRadius,
                            borderSide:
                                BorderSide(color: context.colorScheme.surface),
                          ),
                        ),
                        cursorColor: context.colorScheme.onSecondary,
                      ),
                    ),
                    context.emptySizedHeightBoxLow3x,
                    AnimatedOpacity(
                      duration: context.durationLow,
                      opacity: _viewModel.isClose ? 0.0 : 1.0,
                      child: Padding(
                        padding: context.paddingLow,
                        child: const Text("Yeni Şifre Kontrol"),
                      ),
                    ),
                    AnimatedOpacity(
                      duration: context.durationLow,
                      opacity: _viewModel.isClose ? 0.0 : 1.0,
                      child: TextFormField(
                        validator: (value) {
                          if (passController.text != value) {
                            return 'Şifreler birbiriyle uyuşmuyor !';
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                debugPrint(passController.text);
                                if (_formKey.currentState!.validate()) {
                                  _viewModel.buttonCloseOrOpen();
                                }
                              },
                              icon: const Icon(Icons.next_plan)),
                          filled: true,
                          prefixIcon: const Icon(Icons.lock),
                          hintText: 'Yeni şifrenizi giriniz.',
                          labelText: "Yeni şifre",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: context.lowBorderRadius,
                            borderSide: BorderSide(
                                color: context.colorScheme.onBackground),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: context.lowBorderRadius,
                            borderSide:
                                BorderSide(color: context.colorScheme.surface),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: context.lowBorderRadius,
                            borderSide: const BorderSide(color: Colors.red),
                          ),
                        ),
                        cursorColor: context.colorScheme.onSecondary,
                      ),
                    ),
                    context.emptySizedHeightBoxLow3x,
                    AnimatedOpacity(
                      duration: context.durationLow,
                      opacity: _viewModel.isButtonClose ? 1.0 : 0.0,
                      child: SizedBox(
                        width: double.infinity,
                        height: context.dynamicHeight(0.065),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: context.highBorderRadius),
                              primary: context.colorScheme.onError),
                          onPressed: () {
                            Dio dio = Dio();
                            dio.post(
                                "http://192.168.3.53/api/Persons/new_pass?email=${emailController.text}&pass=${passController.text}");
                            CoolAlert.show(
                                context: context,
                                type: CoolAlertType.success,
                                title: "",
                                text:
                                    'Şifreniz başarıyla değiştirildi !\n Tamam butonuna tıklayıp giriş ekranına gidebilirsiniz.',
                                confirmBtnText: "Tamam",
                                loopAnimation: false,
                                confirmBtnColor: context.colorScheme.onPrimary,
                                onConfirmBtnTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const LoginView()));
                                });
                          },
                          child: BodyText2Copy(
                              data: "Şifreyi Değiştir",
                              color: context.colorScheme.onSurface),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
