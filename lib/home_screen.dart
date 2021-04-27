import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_jsonplaceholder/home_controller.dart';
import 'package:flutter_jsonplaceholder/post.dart';
import 'package:flutter_jsonplaceholder/post_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JSON Placeholder"),
      ),
      body: FutureBuilder(
        future: _controller.getPosts(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              List<Post> posts = snapshot.data;

              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  Post post = posts[index];
                  return Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PostDetailScreen(post)));
                      },
                      title: Text(
                        post.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        post.body,
                        maxLines: 3,
                      ),
                    ),
                  );
                },
              );
            default:
              return Center(
                child: Text("Error. Default clause"),
              );
          }
        },
      ),
    );
  }
}
