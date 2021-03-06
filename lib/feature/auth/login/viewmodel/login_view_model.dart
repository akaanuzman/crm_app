import '../../../../core/init/network/network_manager.dart';

import '../service/i_login_service.dart';
import '../service/login_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {
  BuildContext? context;
  late ILoginService _loginService;

  @observable
  List<String>? item;

  @observable
  bool isRememberMe = false;

  _LoginViewModelBase() {
    _loginService = LoginService(NetworkManager.instance!.dio);
  }

  void setContext(BuildContext context) {
    this.context = context;
  }

  @action
  Future<void> fetchItems(String email, String password) async {
    item = await _loginService.fetchAllTask(email, password);
  }

  @action
  void changeRememberMe() {
    isRememberMe = !isRememberMe;
  }


}
