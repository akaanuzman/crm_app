import 'package:dio/dio.dart';

import '../../constants/app/app_constants.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager? get instance {
    if (_instance != null) {
      return _instance;
    } else {
      _instance = NetworkManager.init();
      return _instance!;
    }
  }

  late final Dio dio;

  NetworkManager.init() {
    dio = Dio(BaseOptions(baseUrl: ApplicationConstants.instance!.baseUrl));
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          handler.next(options);
        },
      ),
    );
  }
}

