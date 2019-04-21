import 'package:flutter/widgets.dart';
import 'package:flutter_imdb/services/database.dart';

class LauncherWidget extends InheritedWidget {

  final DBProvider dbProvider = DBProvider();

  final Widget child;

  LauncherWidget({this.child});

  @override
  bool updateShouldNotify(LauncherWidget oldWidget) {
    return dbProvider != oldWidget.dbProvider;
  }

  static LauncherWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(LauncherWidget);
  }

}