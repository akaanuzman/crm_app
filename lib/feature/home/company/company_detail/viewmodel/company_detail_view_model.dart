import '../../../../../core/init/network/network_manager.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../model/company_detail_model.dart';
import '../service/company_detail_service.dart';
import '../service/i_company_detail_service.dart';

part 'company_detail_view_model.g.dart';

class CompanyDetailViewModel = _CompanyDetailViewModelBase
    with _$CompanyDetailViewModel;

abstract class _CompanyDetailViewModelBase with Store {
  BuildContext? context;
  late ICompanyDetailService companyDetailService;

  @observable
  CompanyDetailModel items = CompanyDetailModel();

  _CompanyDetailViewModelBase() {
    companyDetailService = CompanyDetailService(NetworkManager.instance!.dio);
  }

  void setContext(BuildContext context) {
    this.context = context;
  }

  @action
  Future<void> fetchItems(String token,String id) async {
    items = await companyDetailService.fetchAllTask(token,id);
  }
}
