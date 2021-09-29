import 'package:mobx/mobx.dart';
part 'register_view_model.g.dart';

class RegisterViewModel = _RegisterViewModelBase with _$RegisterViewModel;

abstract class _RegisterViewModelBase with Store {
  @observable
  bool isOpen = false;

  @observable
  bool isClose = true;

  @observable
  bool isButtonClose = false;

  @action
  void openToClose() {
    isOpen = !isOpen;
  }

  @action
  void closeToOpen() {
    isClose = !isClose;
  }

  @action
  void buttonCloseOrOpen() {
    isButtonClose = !isButtonClose;
  }
}
