class MovieModel {
  String id;
  String title;
  String overview;
  String poster;
  DateTime release;
  int runtime;
  double voteAverage;
  int voteCount;

  MovieModel() {}

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    MovieModel _model = MovieModel();
    _model.id = json['imdb_id'];
    _model.title = json['title'];
    _model.overview = json['overview'];
    _model.poster = json['poster_path'];
    _model.release = DateTime.parse(json['release_date']);
    _model.runtime = json['runtime'];
    _model.voteAverage = json['vote_average'];
    _model.voteCount = json['vote_count'];
    return _model;
  }
}