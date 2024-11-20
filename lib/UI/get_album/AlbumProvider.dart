import 'dart:convert';

import 'package:first_api_app/UI/get_album/AlbumModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AlbumProvider extends ChangeNotifier {
  List<AlbumModel> albumList = [];
  Future<List<AlbumModel>> getAlbumData() async {
    var response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    var maxData = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (var data in maxData) {
        albumList.add(AlbumModel.fromJson(data));
      }
      return albumList;
    } else {
      return albumList;
    }
  }
}
