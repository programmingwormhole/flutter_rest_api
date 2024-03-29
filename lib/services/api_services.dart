import 'dart:convert';

import 'package:flutter_api_tutorial/models/posts_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<List<PostsModel>?> fetchData() async {
    final url = Uri.parse('http://127.0.0.1:8000/api/v1/posts?limit=100');

    final response = await http.get(url);

    if (response.statusCode == 200) {

      final jsonData = jsonDecode(response.body);

      final postList = jsonData['results'] as List;

      return postList.map((postJson) => PostsModel.fromJson(postJson)).toList();

    } else {
      print('Failed');
      return null;
    }
  }
}