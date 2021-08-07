enum LoginServiceEndPoints { ENDPOINTS }

extension LoginServiceExtension on LoginServiceEndPoints {
  String  rawValue(String email,String password) {
    switch (this) {
      case LoginServiceEndPoints.ENDPOINTS:
        return 'Foreign/user_login?email=$email&password=$password';
    }
  }
}