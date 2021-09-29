// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:cool_alert/cool_alert.dart';
import 'package:crm_app/core/components/text/subtitle1_copy.dart';
import 'package:crm_app/feature/auth/register/viewmodel/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';

class RegisterView extends StatelessWidget {
  final RegisterViewModel _viewModel = RegisterViewModel();
  final _formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  String verificationCode = "";
  RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.paddingMedium,
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Observer(
            builder: (context) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.network(
                        "http://192.168.3.53/assets/images/logo-dark.png"),
                  ),
                  context.emptySizedHeightBoxLow3x,
                  Subtitle1Copy(data: "Kuvarssoft CRM Sistemine hoş geldiniz !"),
                  context.emptySizedHeightBoxLow3x,
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
                                  'Kayıt isteğiniz başarılı !\n Lütfen mail adresinize gelen doğrulama kodunu giriniz.',
                              confirmBtnText: "Tamam",
                              loopAnimation: true,
                              confirmBtnColor: context.colorScheme.onPrimary,
                            );
                            // Dio dio = Dio();
                            // final response = await dio.get(
                            //     "http://192.168.3.53/api/Foreign/lost_key?email=${emailController.text}");
                            // final mapVerificationCode =
                            //     jsonDecode(response.data);
                            // verificationCode =
                            //     mapVerificationCode['dogrulama'].toString();
                            // debugPrint(verificationCode);
                             _viewModel.openToClose();
                          },
                          child: Text(
                            "Doğrula",
                            style: TextStyle(color: context.colorScheme.onSurface),
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
                ],
              )
          ),
        ),
      ),
    );
  }
}
