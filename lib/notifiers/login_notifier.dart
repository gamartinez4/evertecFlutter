import 'dart:convert';

import 'package:flutter/material.dart';

import '../data_source/api_login.dart';


class LoginNotifier extends ChangeNotifier{

  final ApiLogin apiLogin;

  LoginNotifier(this.apiLogin);

  Future<bool> login (String credentials) async => 
    await apiLogin.verifyCredentials(credentials);

}