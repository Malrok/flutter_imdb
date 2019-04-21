// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteModel _$FavoriteModelFromJson(Map<String, dynamic> json) {
  return FavoriteModel()
    ..id = json['id'] as int
    ..title = json['title'] as String
    ..overview = json['overview'] as String
    ..posterPath = json['poster_path'] as String
    ..release = json['release_date'] == null
        ? null
        : FavoriteModel._dateTimeFromEpochUs(json['release_date'] as int)
    ..runtime = json['runtime'] as int
    ..voteAverage = (json['vote_average'] as num)?.toDouble()
    ..voteCount = json['vote_count'] as int;
}

Map<String, dynamic> _$FavoriteModelToJson(FavoriteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'release_date': instance.release == null
          ? null
          : FavoriteModel._dateTimeToEpochUs(instance.release),
      'runtime': instance.runtime,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount
    };
