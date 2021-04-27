import 'dart:convert';

import 'package:flutter_jsonplaceholder/post.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<List<Post>> fetchPosts() async {
    try {
      var response =
          await http.get("https://jsonplaceholder.typicode.com/posts");

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        List<Post> posts =
            List<Post>.from(result.map((model) => Post.fromMap(model)));
        return posts;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
