import 'package:flutter_imdb/models/credits.dart';

class MovieModel {
  int id;
  String title;
  String overview;
  String posterSmall;
  String posterLarge;
  DateTime release;
  int runtime;
  double voteAverage;
  int voteCount;
  bool adult;
  List<int> genreIds;

  CreditsModel credits;

  MovieModel();

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    MovieModel _model = MovieModel();
    _model.id = json['id'];
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
    _model.adult = json['adult'];
    _model.genreIds = List<int>.from(json['genre_ids']);
    return _model;
  }
}
