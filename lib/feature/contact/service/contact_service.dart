import 'dart:io';

import '../model/contact_model.dart';
import 'contact_service_end_points.dart';
import 'package:dio/dio.dart';

import 'i_contact_service.dart';

class ContactService extends IContactService {
  ContactService(Dio dio) : super(dio);

  @override
  Future<ContactModel> fetchAllTask(String token) async {
    final response =
        await dio.get(ContactServiceEndPoints.contact.rawValue(token));
    if (response.statusCode == HttpStatus.ok) {
      return ContactModel.fromJson(response.data);
    }
    return ContactModel();
  }
}
