import 'package:mobx/mobx.dart';
part 'acces_view_model.g.dart';

class AccessViewModel = _AccessViewModelBase with _$AccessViewModel;

abstract class _AccessViewModelBase with Store {
  @observable
  bool isSwitch = false;

  @action
  void changeSwitch() {
    isSwitch = !isSwitch;
  }
}