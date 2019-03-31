class MovieModel {
  String id;
  String title;
  String overview;
  String posterSmall;
  String posterLarge;
  DateTime release;
  int runtime;
  double voteAverage;
  int voteCount;

  MovieModel();

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    MovieModel _model = MovieModel();
    _model.id = json['imdb_id'];
    _model.title = json['title'];
    _model.overview = json['overview'];
    _model.posterSmall = json['poster_path'];
    _model.posterLarge = json['poster_path'];
    _model.runtime = json['runtime'];
    _model.voteAverage = json['vote_average'].toDouble();
    _model.voteCount = json['vote_count'];
    if (json['release_date'] != null) {
      try {
        _model.release = DateTime.parse(json['release_date']);
      } catch (ex) {
        print('exception while parsing date ${_model.release}');
      }
    }
    return _model;
  }
}
