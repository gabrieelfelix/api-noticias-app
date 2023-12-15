class NewsModel {
  String author;
  String title;
  String description;
  String urlToImage;
  String publishedAt;
  String content;
  bool fav = false;

  NewsModel({
    required this.author,
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
    required this.fav,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        author: json['author'] ?? '',
        title: json['title'] ?? '',
        description: json['description'] ?? '',
        urlToImage: json['urlToImage'] ?? '',
        publishedAt: json['publishedAt'] ?? '',
        content: json['content'] ?? '',
        fav: false,
      );

  Map<String, dynamic> toJson() => {
        'author': author,
        'title': title,
        'description': description,
        'urlToImage': urlToImage,
        'publishedAt': publishedAt,
        'content': content,
        'fav': true,
      };
}
