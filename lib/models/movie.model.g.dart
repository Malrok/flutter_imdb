// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) {
  return MovieModel()
    ..id = json['id'] as int
    ..title = json['title'] as String
    ..overview = json['overview'] as String
    ..posterPath = json['poster_path'] as String
    ..release = json['release'] == null
        ? null
        : DateTime.parse(json['release'] as String)
    ..runtime = json['runtime'] as int
    ..voteAverage = (json['vote_average'] as num)?.toDouble()
    ..voteCount = json['vote_count'] as int
    ..adult = json['adult'] as bool
    ..genreIds = (json['genre_ids'] as List)?.map((e) => e as int)?.toList();
}

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'release': instance.release?.toIso8601String(),
      'runtime': instance.runtime,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'adult': instance.adult,
      'genre_ids': instance.genreIds
    };
