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
  late String airingDate;
  late List genres;

  AnimeModel({
    this.malId = 0,
    this.url = '',
    this.imageUrl = '',
    this.title = '',
    this.trailerUrl = '',
    this.titleEnglish = '',
    this.synopsis = '',
    this.status = '',
    this.episodes = 0,
    this.duration = '',
    this.rating = '',
    this.score = 0,
    this.rank = 0,
    this.airingDate = '',
    this.genres = const [],
  });

  factory AnimeModel.fromJson(Map<String, dynamic> json) {
    List genresList = json['genres'];
    List tempGenresList = [];
    for (int i = 0; i < genresList.length; i++) {
      var moves = json['genres'][i]['name'];
      print('moves : ' + moves);
      tempGenresList.add(moves);
    }

    return AnimeModel(
      malId: json['mal_id'] ?? 0,
      url: json['url'] ?? '',
      imageUrl: json['image_url'] ?? '',
      title: json['title'] ?? '',
      trailerUrl: json['trailer_url'] ?? '',
      titleEnglish: json['title_english'] ?? 'TBA',
      synopsis: json['synopsis'] ?? '',
      status: json['status'] ?? '',
      episodes: json['episodes'] ?? 0,
      duration: json['duration'] ?? '',
      rating: json['rating'] ?? '',
      score: json['score'] ?? 0,
      rank: json['rank'] ?? 0,
      airingDate: json['aired']['string'] ?? '',
      genres: tempGenresList,
    );
  }
}
