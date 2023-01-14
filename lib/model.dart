// num 2
class Post {
  int? userId;
  int? id;
  String? title;
  String? body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> jjson) {
    return Post(
      userId: jjson['userId'],
      id: jjson['id'],
      title: jjson['title'],
      body: jjson['body'],
    );
  }
}
