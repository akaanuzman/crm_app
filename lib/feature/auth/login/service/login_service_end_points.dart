enum LoginServiceEndPoints { endpoints }

extension LoginServiceExtension on LoginServiceEndPoints {
  String  rawValue(String email,String password) {
    switch (this) {
      case LoginServiceEndPoints.endpoints:
        return 'Foreign/user_login?email=$email&password=$password';
    }
  }
}