enum CompanyDetailServiceEndPoints { companyDetail }

extension CompanyDetailServiceExtension on CompanyDetailServiceEndPoints {
  String  rawValue(String token,String id) {
    switch (this) {
      case CompanyDetailServiceEndPoints.companyDetail:
        return 'Companys/get_detail?id=$id&token=$token';
    }
  }
}