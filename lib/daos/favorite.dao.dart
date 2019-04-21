import 'package:flutter_imdb/models/favorite.model.dart';
import 'package:sqflite/sqflite.dart';

class FavoriteDao {

  static const TABLE_NAME = "favorites";

  final Database db;

  FavoriteDao(Database db): this.db = db;

  Future<List<FavoriteModel>> getAll() async {
    var res = await db.query(TABLE_NAME);
    List<FavoriteModel> list =
        res.isNotEmpty ? res.map((m) => FavoriteModel.fromJson(m)).toList() : [];
    return list;
  }

  Future<FavoriteModel> getById(int id) async {
    var res = await db.query(TABLE_NAME, where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? FavoriteModel.fromJson(res.first) : null;
  }

  Future<int> update(FavoriteModel movie) async {
    return db.update(TABLE_NAME, movie.toJson(),
        where: "id = ?", whereArgs: [movie.id]);
  }

  Future<int> insert(FavoriteModel movie) async {
    return db.insert(TABLE_NAME, movie.toJson());
  }

  Future<int> delete(FavoriteModel movie) async {
    return db.delete(TABLE_NAME, where: "id = ?", whereArgs: [movie.id]);
  }
}
