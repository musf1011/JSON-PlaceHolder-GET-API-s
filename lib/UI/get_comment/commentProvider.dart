import 'dart:convert';

import 'package:first_api_app/UI/get_comment/commentModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CommentProvider extends ChangeNotifier {
  List<commmentModel> commentList = [];
  Future<List<commmentModel>> getCommentData() async {
    var response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
    var maxData = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (var data in maxData) {
        commentList.add(commmentModel.fromJson(data));
      }
      return commentList;
    } else {
      return commentList;
    }
  }
}
