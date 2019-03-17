import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_imdb/blocs/bloc_provider.dart';
import 'package:flutter_imdb/blocs/home_bloc.dart';
import 'package:flutter_imdb/models/movie.dart';
import 'package:flutter_imdb/services/translations.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: Text(Translations.of(context).text('home_title'))),
        body: Home());
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  HomeBloc _homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        bloc: _homeBloc,
        child: StreamBuilder<List<MovieModel>>(
          stream: _homeBloc.moviesList,
          builder:
              (BuildContext context, AsyncSnapshot<List<MovieModel>> snapshot) {
            if (snapshot.hasData) {
              return new ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemBuilder: (context, index) {
                  return new ListTile(
                      /*leading: new Hero(
                        tag: 'photo' + index.toString(),
                        child: Material(
                            child: new Image.network(
                                snapshot.data.documents[index]['picture'],
                                width: 64.0,
                                height: 64.0))),
                      title: new Text(snapshot.data.documents[index]['first_name']),
                      subtitle:
                      new Text(snapshot.data.documents[index]['last_name']),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserDetailPage(
                                    id: snapshot.data.documents[index].documentID,
                                    picturePath: snapshot.data.documents[index]
                                    ['picture'],
                                    photoTag: index.toString())));*/
                      leading: Image.network(
                                  snapshot.data[index].poster,
                                  width: 64.0,
                                  height: 64.0),
                      title: new Text(snapshot.data[index].title));
                },
                itemCount: snapshot.data.length,
              );
            } else {
              return Container();
            }
          },
        ));
  }
}
