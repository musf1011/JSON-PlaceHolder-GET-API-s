import 'dart:convert';

import 'package:first_api_app/UI/get_user/userModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier {
  List<UserModel> userList = [];

  Future<List<UserModel>> getUserData() async {
    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var maxData = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (var data in maxData) {
        userList.add(UserModel.fromJson(data));
      }
      return userList;
    } else {
      return userList;
    }
  }
}
