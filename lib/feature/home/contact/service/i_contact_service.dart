import 'package:dio/dio.dart';

import '../model/contact_model.dart';

abstract class IContactService {
  final Dio dio;

  IContactService(this.dio);

  Future<ContactModel> fetchAllTask(String token);
}
