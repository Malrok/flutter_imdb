import 'dart:async';

import 'package:flutter_imdb/blocs/bloc_provider.dart';
import 'package:flutter_imdb/models/movie.model.dart';
import 'package:flutter_imdb/services/tmdb.dart';

class LatestBloc extends BlocBase {
  StreamController<List<MovieModel>> _controller = StreamController<List<MovieModel>>();
  Stream<List<MovieModel>> get moviesList => _controller.stream;

  LatestBloc() {
    tmdbService.getRecentMoviesList().then((List<MovieModel> list) {
      this._controller.add(list);
    });
  }

  @override
  void dispose() {
    this._controller.close();
  }
}
