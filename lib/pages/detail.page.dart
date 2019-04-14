import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_imdb/blocs/bloc_provider.dart';
import 'package:flutter_imdb/blocs/detail.bloc.dart';
import 'package:flutter_imdb/models/movie.model.dart';
import 'package:flutter_imdb/services/tmdb.dart';
import 'package:flutter_imdb/services/translations.dart';
import 'package:flutter_imdb/widgets/poster.widget.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  final int movieId;

  DetailPage({@required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: Text(Translations.of(context).text('detail_title'))),
        body: Detail(movieId: this.movieId));
  }
}

class Detail extends StatefulWidget {
  final int movieId;

  Detail({@required this.movieId});

  @override
  State<StatefulWidget> createState() => DetailState(movieId: this.movieId);
}

class DetailState extends State<Detail> {
  DetailBloc _detailBloc;
  final int movieId;

  DetailState({@required this.movieId});

  @override
  void initState() {
    super.initState();
    _detailBloc = DetailBloc(this.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16.0),
        child: BlocProvider(
            bloc: _detailBloc,
            child: StreamBuilder<MovieModel>(
                stream: _detailBloc.movieDetail,
                builder:
                    (BuildContext context, AsyncSnapshot<MovieModel> snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                        margin: EdgeInsets.all(16),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Poster(
                                image: snapshot.data.posterPath,
                                small: true,
                              ),
                              Expanded(
                                  child: Container(
                                      padding: new EdgeInsets.only(left: 8.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(snapshot.data.title),
                                            Text(tmdbService.getGenresFromIds(
                                                    snapshot.data.genreIds) +
                                                ' - ' +
                                                (snapshot.data.release != null
                                                    ? DateFormat('dd/MM/yyyy')
                                                        .format(snapshot
                                                            .data.release)
                                                    : ''))
                                          ]))),
                              Text(snapshot.data.voteAverage.toString())
                            ]));
                  } else {
                    return Container();
                  }
                })));
  }
}
