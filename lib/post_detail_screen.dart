import 'package:flutter/material.dart';

import 'post.dart';

class PostDetailScreen extends StatelessWidget {
  final Post post;

  PostDetailScreen(this.post);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Center(
                  child: Text(
                post.body,
                textAlign: TextAlign.center,
              ))),
        ],
      ),
    );
  }
}
