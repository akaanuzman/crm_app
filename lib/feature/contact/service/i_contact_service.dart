import '../model/contact_model.dart';
import 'package:dio/dio.dart';

abstract class IContactService {
  final Dio dio;

  IContactService(this.dio);

  Future<ContactModel> fetchAllTask(String token);
}
