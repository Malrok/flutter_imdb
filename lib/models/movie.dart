import 'package:flutter_imdb/models/cast.dart';
import 'package:flutter_imdb/models/crew.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()

class MovieModel {
  int id;
  String title;
  String overview;
  @JsonKey(name: 'poster_small')
  String posterSmall;
  @JsonKey(name: 'poster_large')
  String posterLarge;
  DateTime release;
  int runtime;
  @JsonKey(name: 'vote_average')
  double voteAverage;
  @JsonKey(name: 'vote_count')
  int voteCount;
  bool adult;

  @JsonKey(ignore: true)
  List<String> genres;
  @JsonKey(ignore: true)
  List<CrewModel> crew;
  @JsonKey(ignore: true)
  List<CastModel> cast;

  MovieModel();

  factory MovieModel.fromJson(Map<String, dynamic> json) => _$MovieModelFromJson(json);
}
