import '../../../core/constants/app/app_constants.dart';
import '../../../core/init/network/network_manager.dart';
import '../model/company_model.dart';
import '../service/company_service.dart';
import '../service/i_company_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'company_view_model.g.dart';

class CompanyViewModel = _CompanyViewModelBase with _$CompanyViewModel;

abstract class _CompanyViewModelBase with Store {
  BuildContext? context;
  late ICompanyService companyService;

  @observable
  CompanyModel items = CompanyModel();

  _CompanyViewModelBase() {
    companyService = CompanyService(NetworkManager.instance!.dio);
    fetchItems(ApplicationConstants.instance!.token);
  }

  void setContext(BuildContext context) {
    this.context = context;
  }

  @action
  Future<void> fetchItems(String token) async {
    items = await companyService.fetchAllTask(token);
  }
}
