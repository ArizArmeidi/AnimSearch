class AnimeModel {
  late int malId;
  late String url;
  late String imageUrl;
  late String title;
  late String trailerUrl;
  late String titleEnglish;
  late String synopsis;
  late String status;
  late int episodes;
  late String duration;
  late String rating;
  late double score;
  late int rank;

  AnimeModel({
    required this.malId,
    required this.url,
    required this.imageUrl,
    required this.title,
    required this.trailerUrl,
    required this.titleEnglish,
    required this.synopsis,
    required this.status,
    required this.episodes,
    required this.duration,
    required this.rating,
    required this.score,
    required this.rank,
  });

  factory AnimeModel.fromJson(Map<String, dynamic> json) {
    return AnimeModel(
      malId: json['mal_id'] ?? 1,
      url: json['url'] ?? '',
      imageUrl: json['image_url'] ?? '',
      title: json['title'] ?? '',
      trailerUrl: json['trailer_url'] ?? '',
      titleEnglish: json['title_english'] ?? '',
      synopsis: json['synopsis'] ?? '',
      status: json['status'] ?? '',
      episodes: json['episodes'] ?? 0,
      duration: json['duration'] ?? '',
      rating: json['rating'] ?? '',
      score: json['score'] ?? 0,
      rank: json['rank'] ?? 0,
    );
  }
}
