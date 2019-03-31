import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_imdb/pages/latest.dart';
import 'package:flutter_imdb/pages/search.dart';
import 'package:flutter_imdb/services/translations.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Home();
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.alarm)),
              Tab(icon: Icon(Icons.search))
            ],
          ),
          title: Text(Translations.of(context).text('home_title')),
        ),
        body: TabBarView(
          children: [
            LatestMovies(),
            SearchMovie()
          ],
        ),
      ),
    );
  }
}
