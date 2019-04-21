import 'dart:async';

import 'package:flutter_imdb/blocs/bloc_provider.dart';
import 'package:flutter_imdb/daos/favorite.dao.dart';
import 'package:flutter_imdb/models/favorite.model.dart';
import 'package:flutter_imdb/services/database.dart';
import 'package:sqflite/sqflite.dart';

class FavoritesBloc extends BlocBase {
  StreamController<List<FavoriteModel>> _controller = StreamController<List<FavoriteModel>>();
  Stream<List<FavoriteModel>> get moviesList => _controller.stream;

  FavoritesBloc(DBProvider provider) {
    provider.database.then((Database db) {
      FavoriteDao(db).getAll().then((List<FavoriteModel> movies) => this._controller.add(movies));
    });
  }

  @override
  void dispose() {
    this._controller.close();
  }
}
