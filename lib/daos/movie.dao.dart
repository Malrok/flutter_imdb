import 'package:flutter_imdb/models/movie.model.dart';
import 'package:flutter_imdb/services/database.dart';
import 'package:sqflite/sqflite.dart';

class MovieDao {

  static const TABLE_NAME = "movies";

  Future<Database> _initFuture;
  Database _db;

  MovieDao() {
    _initFuture = dbProvider.database.then((res) => _db = res);
  }

  Future<List<MovieModel>> getAll() async {
    if (_db == null) {
      await _initFuture;
    }
    var res = await _db.query(TABLE_NAME);
    List<MovieModel> list =
        res.isNotEmpty ? res.map((m) => MovieModel.fromJson(m)).toList() : [];
    return list;
  }

  Future<MovieModel> getById(int id) async {
    if (_db == null) {
      await _initFuture;
    }
    var res = await _db.query(TABLE_NAME, where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? MovieModel.fromJson(res.first) : null;
  }

  Future<int> update(MovieModel movie) async {
    if (_db == null) {
      await _initFuture;
    }
    return _db.update(TABLE_NAME, movie.toJson(),
        where: "id = ?", whereArgs: [movie.id]);
  }

  Future<int> insert(MovieModel movie) async {
    if (_db == null) {
      await _initFuture;
    }
    return _db.insert(TABLE_NAME, movie.toJson());
  }

  Future<int> delete(MovieModel movie) async {
    if (_db == null) {
      await _initFuture;
    }
    return _db.delete(TABLE_NAME, where: "id = ?", whereArgs: [movie.id]);
  }
}

MovieDao movieDao = MovieDao();
