import 'dart:convert';

class Posts {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  Posts({
    this.userId,
    this.id,
    this.title,
    this.body
  });

  factory Posts.mapFromJson(Map<String, dynamic> map) {
    return Posts(
      userId: map["userId"],
      id: map["id"],
      title: map["title"],
      body: map["body"]
    );
  }

}

List<Posts> postsFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Posts>.from(data.map((item) => Posts.mapFromJson(item)));
}