class MovieModel {
  String _id;
  String _title;
  String _overview;
  String _poster;
  DateTime _release;
  int _runtime;
  int _voteAverage;
  int _voteCount;

  MovieModel() {}

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    MovieModel _model = MovieModel();
    _model._id = json['imdb_id'];
    _model._title = json['title'];
    _model._overview = json['overview'];
    _model._poster = json['poster_path'];
    _model._release = json['release_date'];
    _model._runtime = json['runtime'];
    _model._voteAverage = json['vote_average'];
    _model._voteCount = json['vote_count'];
    return _model;
  }
}