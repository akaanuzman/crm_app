enum CompanyServiceEndPoints { company }

extension CompanyServiceExtension on CompanyServiceEndPoints {
  String  rawValue(String token) {
    switch (this) {
      case CompanyServiceEndPoints.company:
        return 'Companys/get_company?token=$token';
    }
  }
}