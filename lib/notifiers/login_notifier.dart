import 'package:flutter/material.dart';
import '../data_source/interface/i_api_login.dart';


class LoginNotifier extends ChangeNotifier{

  final IApiLogin apiLogin;

  LoginNotifier(this.apiLogin);

  Future<bool> login (String credentials) async => 
    await apiLogin.verifyCredentials(credentials);

}