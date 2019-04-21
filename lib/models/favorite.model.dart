import 'package:flutter_imdb/models/cast.model.dart';
import 'package:flutter_imdb/models/crew.model.dart';
import 'package:flutter_imdb/models/movie.model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'favorite.model.g.dart';

@JsonSerializable()

class FavoriteModel {
  int id;
  String title;
  String overview;
  @JsonKey(name: 'poster_path')
  String posterPath;
  @JsonKey(name: 'release_date', fromJson: _dateTimeFromEpochUs, toJson: _dateTimeToEpochUs)
  DateTime release;
  int runtime;
  @JsonKey(name: 'vote_average')
  double voteAverage;
  @JsonKey(name: 'vote_count')
  int voteCount;
//  @JsonKey(name: 'genre_ids')
//  List<int> genreIds;
//
//  @JsonKey(ignore: true)
//  List<CrewModel> crew;
//  @JsonKey(ignore: true)
//  List<CastModel> cast;

  FavoriteModel();

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => _$FavoriteModelFromJson(json);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = _$FavoriteModelToJson(this);
    json.remove('genre_ids');
    return json;
  }

  MovieModel toMovie() => MovieModel()
    ..id = this.id
    ..title = this.title
    ..overview = this.overview
    ..posterPath = this.posterPath
    ..release = this.release
    ..runtime = this.runtime
    ..voteAverage = this.voteAverage
    ..voteCount = this.voteCount;

  static DateTime _dateTimeFromEpochUs(int us) =>
      DateTime.fromMicrosecondsSinceEpoch(us);

  static int _dateTimeToEpochUs(DateTime dateTime) =>
      dateTime.microsecondsSinceEpoch;
}
