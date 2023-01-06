class HomeCardModel {
  late int malId;
  late String url;
  late String imageUrl;
  late String title;

  HomeCardModel({
    required this.malId,
    required this.url,
    required this.imageUrl,
    required this.title,
  });

  factory HomeCardModel.fromJson(Map<String, dynamic> json) {
    return HomeCardModel(
      malId: json['mal_id'],
      url: json['url'],
      imageUrl: json['images']['jpg']['image_url'],
      title: json['title'],
    );
  }
}
