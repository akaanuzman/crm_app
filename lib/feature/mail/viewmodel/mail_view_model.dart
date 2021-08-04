import 'package:mobx/mobx.dart';

part 'mail_view_model.g.dart';

class MailViewModel = _MailViewModelBase with _$MailViewModel;

abstract class _MailViewModelBase with Store {
  @observable
  bool isContainerHeightChange = true;

  @action
  void changeContainerHeight() {
    isContainerHeightChange = !isContainerHeightChange;
  }


}
