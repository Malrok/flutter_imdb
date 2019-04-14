import 'dart:async';

import 'package:flutter_imdb/blocs/bloc_provider.dart';
import 'package:flutter_imdb/models/movie.model.dart';
import 'package:flutter_imdb/services/tmdb.dart';

class DetailBloc extends BlocBase {
  StreamController<MovieModel> _controller = StreamController<MovieModel>();
  Stream<MovieModel> get movieDetail => _controller.stream;

  DetailBloc(int movieId) {
    tmdbService.getMovieById(movieId).then((MovieModel movie) {
      this._controller.add(movie);
    });

  }

  @override
  void dispose() {
    this._controller.close();
  }
}
