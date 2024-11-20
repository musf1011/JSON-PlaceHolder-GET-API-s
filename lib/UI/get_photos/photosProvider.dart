import 'dart:convert';

import 'package:first_api_app/UI/get_photos/photoModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PhotosProvider extends ChangeNotifier {
  List<PhotosModel> photosList = [];
  Future<List<PhotosModel>> getPhotosData() async {
    var response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var maxData = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (var data in maxData) {
        photosList.add(PhotosModel.fromJson(data));
      }
      return photosList;
    } else {
      return photosList;
    }
  }
}
