import 'package:flutter_jsonplaceholder/api.dart';
import 'package:flutter_jsonplaceholder/post.dart';

class HomeController {
  Api _api = Api();

  Future<List<Post>> getPosts() async {
    return _api.fetchPosts();
  }
}
