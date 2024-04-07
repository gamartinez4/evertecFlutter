import 'dart:convert';

import 'package:flutter/services.dart';

class ApiLogin{

  Future<bool> verifyCredentials(String credentials) async {
    try {
      final jsonString = await rootBundle.loadString('llaves_ingreso.txt');
      final Map<String, dynamic> credentialsJson = json.decode(jsonString);

      final Map<String, dynamic> credentialsToVerify = json.decode(credentials);
      credentialsToVerify.forEach((key, value) {print('$key:$value');});

      bool isValid = credentialsJson['document_type'] == credentialsToVerify['document_type'] &&
                    credentialsJson['document_number'] == credentialsToVerify['document_number'] &&
                    credentialsJson['password'] == credentialsToVerify['password'];

      return isValid;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
}