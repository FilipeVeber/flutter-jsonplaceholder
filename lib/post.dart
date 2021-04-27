class Post {
  final int id;
  final String title;
  final String body;

  Post(this.id, this.title, this.body);

  factory Post.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Post(
      map["id"],
      map["title"],
      map["body"],
    );
  }
}
