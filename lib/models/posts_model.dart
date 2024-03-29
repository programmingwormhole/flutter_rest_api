class PostsModel {
  final int id;
  final String title;
  final String description;
  final String thumbnail;

  PostsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnail,
  });

  factory PostsModel.fromJson(Map<String, dynamic> json) {
    return PostsModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      thumbnail: json['thumbnail'],
    );
  }
}
