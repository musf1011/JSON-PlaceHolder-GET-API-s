import 'dart:convert';

import 'package:first_api_app/UI/get_post/postModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostProvider extends ChangeNotifier {
  List<postModel> postList = [];
  Future<List<postModel>> getPostData() async {
    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var maxData = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (var data in maxData) {
        postList.add(postModel.fromJson(data));
      }
      return postList;
    } else {
      return postList;
    }
  }
}
