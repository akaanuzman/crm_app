class ApplicationConstants {
  static ApplicationConstants? _instance;
  static ApplicationConstants? get instance {
    if (_instance != null) {
      return _instance;
    } else {
      _instance = ApplicationConstants.init();
      return _instance!;
    }
  }

  ApplicationConstants.init();

  final String baseUrl = "http://192.168.3.53/api/";
  String token = "";
}
