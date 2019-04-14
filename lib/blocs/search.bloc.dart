import 'dart:async';

import 'package:flutter_imdb/blocs/bloc_provider.dart';
import 'package:flutter_imdb/models/movie.model.dart';
import 'package:flutter_imdb/services/tmdb.dart';

class SearchBloc extends BlocBase {
  StreamController<List<MovieModel>> _controller =
      StreamController<List<MovieModel>>();

  Stream<List<MovieModel>> get moviesList => _controller.stream;

  StreamController _actionController = StreamController();

  StreamSink get updateList => _actionController.sink;

  SearchBloc() {
    _actionController.stream.listen(_handleLogic);
  }

  @override
  void dispose() {
    this._controller.close();
    this._actionController.close();
  }

  void _handleLogic(data) {
    if (data.length >= 2) {
      tmdbService.getMoviesListByTitle(data).then((List<MovieModel> list) {
        this._controller.add(list);
      }).catchError((error) => print(error));
    } else {
      this._controller.add(List<MovieModel>());
    }
  }
}
