import 'dart:convert';

import 'package:flutter_imdb/models/configuration.dart';
import 'package:flutter_imdb/models/movie.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class TheMovieDatabaseService {
  static const String _URL = 'https://api.themoviedb.org/3';
  static const String _API_KEY = 'api_key=48d02d2803f669be5643367e3307dd43';
  static const String _LANG = 'language=fr-FR';

  ConfigurationModel configuration;

  bool _initializing = true;

  TheMovieDatabaseService() {
    this._getConfiguration();
  }

  Future<void> _getConfiguration() async {
    
    if (this._initializing) {
      return Future.value(null);
    }
    
    Map<String, dynamic> config;
    Map<String, dynamic> genres;

    return http.get('$_URL/configuration?$_API_KEY').then((response) {
      if (response.statusCode == 200) {
         config = json.decode(response.body);
      } else {
        // If that response was not OK, throw an error.
        throw Exception('Failed to load configuration');
      }
      return http.get('$_URL/genre/movie/list?$_API_KEY');
    }).then((response) {
      if (response.statusCode == 200) {
        genres = json.decode(response.body);
        this.configuration = ConfigurationModel.fromJson(config, genres);
        this._initializing = false;
      } else {
        // If that response was not OK, throw an error.
        throw Exception('Failed to load configuration');
      }
    });
  }

  Future<List<MovieModel>> getRecentMoviesList() async {
    await this._getConfiguration();
    
    List<MovieModel> movies;
    final now = DateTime.now();
    final response = await http.get(_URL +
        '/discover/movie?' +
        'primary_release_date.gte=' +
        DateFormat('yyyy-MM-dd').format(now.subtract(new Duration(days: 30))) +
        '&primary_release_date.lte=' +
        DateFormat('yyyy-MM-dd').format(now) +
        '&' +
        _LANG +
        '&' +
        _API_KEY);
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      if (body['total_results'] > 0) {
        var results = body['results'] as List;
        movies = results.map((movie) => MovieModel.fromJson(movie)).toList();
        movies.sort((a, b) {
          if (a.release == null || b.release == null) {
            return 0;
          }
          if (a.release.isBefore(b.release)) {
            return 1;
          } else {
            return -1;
          }
        });
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
    await this._getConfiguration();
    
    List<MovieModel> movies;
    final response = await http.get(
        '$_URL/search/movie?query=${title.replaceAll(' ', '+')}&$_LANG&$_API_KEY');
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
    await this._getConfiguration();
    
    MovieModel movie;
    var url = '$_URL/movie/$movieId?$_LANG&$_API_KEY';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      movie = MovieModel.fromJson(body);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load movies');
    }
    return movie;
  }

  String getGenresFromIds(List<int> genreIds) {
    if (!this._initializing) {
      return genreIds.map((int genreId) => this.configuration.genres[genreId]).join(', ');
    } else {
      return '';
    }
  }

}

TheMovieDatabaseService tmdbService = TheMovieDatabaseService();
