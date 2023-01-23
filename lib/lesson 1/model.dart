// num 2
class PostData {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostData({this.userId, this.id, this.title, this.body});

  factory PostData.fromJson(Map<String, dynamic> jjson) {
    return PostData(
      userId: jjson['userId'],
      id: jjson['id'],
      title: jjson['title'],
      body: jjson['body'],
    );
  }
}
