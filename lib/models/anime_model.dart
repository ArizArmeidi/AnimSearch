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
  late int score;
  late int rank;
  late String opTheme;
  late String edTheme;

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
    required this.opTheme,
    required this.edTheme,
  });

  factory AnimeModel.fromJson(Map<String, dynamic> json) {
    return AnimeModel(
      malId: json['mal_id'],
      url: json['url'],
      imageUrl: json['image_url'],
      title: json['title'],
      trailerUrl: json['trailer_url'],
      titleEnglish: json['title_english'],
      synopsis: json['synopsis'],
      status: json['status'],
      episodes: json['episodes'],
      duration: json['duration'],
      rating: json['rating'],
      score: json['score'],
      rank: json['rank'],
      opTheme: json['opening_themes'],
      edTheme: json['ending_themes'],
    );
  }
}
