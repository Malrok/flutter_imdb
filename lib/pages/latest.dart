import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_imdb/blocs/bloc_provider.dart';
import 'package:flutter_imdb/blocs/latest_bloc.dart';
import 'package:flutter_imdb/models/movie.dart';
import 'package:flutter_imdb/widgets/poster.dart';
import 'package:intl/intl.dart';

class LatestMovies extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LatestMoviesState();
}

class LatestMoviesState extends State<LatestMovies> {
  LatestBloc _latestBloc = LatestBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        bloc: _latestBloc,
        child: StreamBuilder<List<MovieModel>>(
          stream: _latestBloc.moviesList,
          builder:
              (BuildContext context, AsyncSnapshot<List<MovieModel>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemBuilder: (context, index) {
                  return Card(
                      child: Container(
                          margin: EdgeInsets.all(16),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Poster(
                              image: snapshot.data[index].posterSmall,
                              small: true,
                            ),
                            Expanded(
                                child: Container(
                                    padding: new EdgeInsets.only(left: 8.0),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(snapshot.data[index].title),
                                          Text(DateFormat('dd/MM/yyyy').format(
                                              snapshot.data[index].release))
                                        ]))),
                            Text(snapshot.data[index].voteAverage.toString())
                          ]))
                      /*child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                        SizedBox(
                          height: 184.0,
                          child: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                  // In order to have the ink splash appear above the image, you
                                  // must use Ink.image. This allows the image to be painted as part
                                  // of the Material and display ink effects above it. Using a
                                  // standard Image will obscure the ink splash.
                                  child: Image.network(
                                      snapshot.data[index].posterSmall,
                                      width: 64.0,
                                      height: 64.0)),
                              Positioned(
                                bottom: 16.0,
                                left: 16.0,
                                right: 16.0,
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  alignment: Alignment.centerLeft,
                                  child: Text(snapshot.data[index].title),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Description and share/explore buttons.
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                          child: DefaultTextStyle(
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                            style: descriptionStyle,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // three line description
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(snapshot.data[index].overview),
                                ),
                                Text(DateFormat('dd/MM/yyyy')
                                    .format(snapshot.data[index].release)),
                              ],
                            ),
                          ),
                        ),
                      ]));*/
                      );
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
