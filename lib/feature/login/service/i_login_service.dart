import 'package:dio/dio.dart';

abstract class ILoginService {
  final Dio dio;

  ILoginService(this.dio);

  Future<String> fetchAllTask(String email,String password);
}
