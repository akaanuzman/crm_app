import 'package:mobx/mobx.dart';

part 'reset_pass_view_model.g.dart';

class ResetPassViewModel = _ResetPassViewModelBase with _$ResetPassViewModel;

abstract class _ResetPassViewModelBase with Store {
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
