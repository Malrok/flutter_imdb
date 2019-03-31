import 'dart:convert';

import 'package:flutter_imdb/models/movie.dart';
import 'package:flutter_imdb/models/tmdb.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class TheMovieDatabaseService {
  static const String _URL = 'https://api.themoviedb.org/3';
  static const String _API_KEY = 'api_key=48d02d2803f669be5643367e3307dd43';
  static const String _LANG = 'language=fr-FR';

  TmdbModel configuration;

  TheMovieDatabaseService() {
    this._getConfiguration();
  }

  Future<dynamic> _getConfiguration() async {
    final response = await http.get('$_URL/configuration?$_API_KEY');
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      this.configuration = TmdbModel.fromJson(body);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load configuration');
    }
  }

  Future<List<MovieModel>> getRecentMoviesList() async {
    List<MovieModel> movies;
    final now = DateTime.now();
    final response = await http.get(_URL +
        '/discover/movie?primary_release_date.gte=' +
        DateFormat('yyyy-MM-dd').format(now.subtract(new Duration(days: 30))) +
        '&primary_release_date.lte=' +
        DateFormat('yyyy-MM-dd').format(now) +
        '&' +
        _API_KEY);
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      if (body['total_results'] > 0) {
        var results = body['results'] as List;
        movies = results.map((movie) => MovieModel.fromJson(movie)).toList();
        movies.sort((a, b) => a.release.isBefore(b.release) ? 1 : -1);
      } else {
        throw Exception('no results');
      }
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load movies');
    }
    return movies;
  }

  Future<List<MovieModel>> getMoviesListByTitle(String title) async {
    List<MovieModel> movies;
    final response = await http.get(
        '$_URL/search/movie?query=${title.replaceAll(' ', '+')}&$_API_KEY');
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
      throw Exception('Failed to load movies');
    }
    return movies;
  }

  Future<MovieModel> getMovieById(int movieId) async {
    MovieModel movie;
    final response = await http.get('$_URL/movie/$movieId&$_API_KEY');
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      movie = MovieModel.fromJson(body);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load movies');
    }
    return movie;
  }
}

TheMovieDatabaseService tmdbService = TheMovieDatabaseService();
