class LoungePostModel {
  late int id;
  late int userId;
  late String title;
  late String content;
  late String imageUrl;

  LoungePostModel.fromJson(dynamic json) {
    id = json['id'] ?? -1;
    userId = json['user'] ?? -1;
    title = json['title'] ?? "제목없음";
    content = json['content'] ?? "내용없음";
    imageUrl = json['image'] ?? '';
  }
}
