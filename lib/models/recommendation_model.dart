class RecommendationModel {
  late int malId;
  late String url;
  late String imageUrl;
  late String title;

  RecommendationModel({
    this.malId = 1,
    this.url = '',
    this.imageUrl = '',
    this.title = '',
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
      malId: json['mal_id'] ?? 1,
      url: json['url'] ?? '',
      imageUrl: json['image_url'] ?? '',
      title: json['title'] ?? '',
    );
  }
}
