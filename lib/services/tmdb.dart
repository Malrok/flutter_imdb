import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_imdb/models/movie.dart';

class TheMovieDatabaseService {

  static const String URL = 'https://api.themoviedb.org/3/';

  static Future<List<MovieModel>> getRecentMoviesList() async {
    List<MovieModel> movies;
    final response = await http.get(URL + 'discover/movie?primary_release_date.gte=2014-09-15&primary_release_date.lte=2014-10-22&api_key=48d02d2803f669be5643367e3307dd43');
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      if (body['total_results'] > 0) {
        var results = body['results'] as List;
        movies = results.map((movie) => MovieModel.fromJson(movie)).toList();
      } else {
        throw Exception('no results');
      }
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
    return movies;
  }

}