import 'package:flutter_imdb/models/cast.dart';
import 'package:flutter_imdb/models/crew.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()

class MovieModel {
  int id;
  String title;
  String overview;
  @JsonKey(name: 'poster_path')
  String posterPath;
  @JsonKey(name: 'release_date')
  DateTime release;
  int runtime;
  @JsonKey(name: 'vote_average')
  double voteAverage;
  @JsonKey(name: 'vote_count')
  int voteCount;
  bool adult;
  @JsonKey(name: 'genre_ids')
  List<int> genreIds;

  @JsonKey(ignore: true)
  List<CrewModel> crew;
  @JsonKey(ignore: true)
  List<CastModel> cast;

  MovieModel();

  factory MovieModel.fromJson(Map<String, dynamic> json) => _$MovieModelFromJson(json);
}
