import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_imdb/blocs/bloc_provider.dart';
import 'package:flutter_imdb/blocs/latest_bloc.dart';
import 'package:flutter_imdb/models/movie.dart';
import 'package:flutter_imdb/widgets/movie-card.dart';

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
                    movie: snapshot.data[index]
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
