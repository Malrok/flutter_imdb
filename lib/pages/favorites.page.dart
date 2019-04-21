import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_imdb/blocs/bloc_provider.dart';
import 'package:flutter_imdb/blocs/favorites.bloc.dart';
import 'package:flutter_imdb/models/favorite.model.dart';
import 'package:flutter_imdb/pages/detail.page.dart';
import 'package:flutter_imdb/widgets/launcher.widget.dart';
import 'package:flutter_imdb/widgets/movie-card.widget.dart';

class FavoriteMovies extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FavoriteMoviesState();
}

class FavoriteMoviesState extends State<FavoriteMovies> {

  @override
  Widget build(BuildContext context) {
    FavoritesBloc _favoritesBloc = FavoritesBloc(LauncherWidget.of(context).dbProvider);
    return BlocProvider(
        bloc: _favoritesBloc,
        child: StreamBuilder<List<FavoriteModel>>(
          stream: _favoritesBloc.moviesList,
          builder:
              (BuildContext context, AsyncSnapshot<List<FavoriteModel>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemBuilder: (context, index) {
                  return MovieCard(
                      movie: snapshot.data[index].toMovie(),
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
