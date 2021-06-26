class HomeCardModel {
  late int malId;
  late String url;
  late String imageUrl;
  late String title;
  late int episodes;

  HomeCardModel({
    required this.malId,
    required this.url,
    required this.imageUrl,
    required this.title,
    required this.episodes,
  });

  factory HomeCardModel.fromJson(Map<String, dynamic> json) {
    return HomeCardModel(
      malId: json['mal_id'],
      url: json['url'],
      imageUrl: json['image_url'],
      title: json['title'],
      episodes: json['episodes'] ?? 0,
    );
  }
}
