class Author {
  var userId;
  var id;
  var title;
  var body;

  Author({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      userId: json['userId'].toString(),
      id: json['id'].toString(),
      title: json['title'],
      body: json['body'],
    );
  }
}
