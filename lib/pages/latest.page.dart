import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_imdb/blocs/bloc_provider.dart';
import 'package:flutter_imdb/blocs/latest.bloc.dart';
import 'package:flutter_imdb/models/movie.model.dart';
import 'package:flutter_imdb/pages/detail.page.dart';
import 'package:flutter_imdb/widgets/movie-card.widget.dart';

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
                  return MovieCard(
                      movie: snapshot.data[index],
                      onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPage(
                                      movieId: snapshot.data[index].id,
                                    )),
                          ));
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
