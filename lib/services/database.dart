import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static const String _DB_NAME = "imdb.db";
  static const int _DB_VERSION = 1;

  Future<Database> _initFuture;
  Database _database;

  DBProvider() {
    _initFuture = initDB().then((res) => _database = res);
  }

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    } else {
      return _initFuture;
    }
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _DB_NAME);

    return await openDatabase(path, version: _DB_VERSION, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      List<Future> futures = [];
      String lines = await rootBundle.loadString("assets/database/create.sql");
      lines.split('\\n').forEach((line) => futures.add(db.execute(line)));
      return Future.wait(futures);
    });
  }
}

DBProvider dbProvider = DBProvider();
