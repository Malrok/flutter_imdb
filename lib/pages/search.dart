import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_imdb/blocs/bloc_provider.dart';
import 'package:flutter_imdb/blocs/search_bloc.dart';
import 'package:flutter_imdb/models/movie.dart';
import 'package:flutter_imdb/services/translations.dart';
import 'package:flutter_imdb/widgets/poster.dart';
import 'package:intl/intl.dart';

class SearchMovie extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SearchMovieState();
}

class SearchMovieState extends State<SearchMovie> {
  SearchBloc _searchBloc = SearchBloc();

  final _formKey = GlobalKey<FormState>();

  TextEditingController _controller = new TextEditingController();

  SearchMovieState() {
    this._controller.addListener(onChange);
  }

  void onChange() {
    _searchBloc.updateList.add(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16.0),
        child: BlocProvider(
            bloc: _searchBloc,
            child: Form(
                key: _formKey,
                child: Column(children: [
                  TextFormField(
                    controller: _controller,
                    decoration: InputDecoration(
                        labelText: Translations.of(context)
                            .text('search_placeholder')),
                  ),
                  Expanded(
                      child: StreamBuilder<List<MovieModel>>(
                    stream: _searchBloc.moviesList,
                    builder: (BuildContext context,
                        AsyncSnapshot<List<MovieModel>> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemBuilder: (context, index) {
                            return Card(
                                child: Container(
                                    margin: EdgeInsets.all(16),
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Poster(
                                            image: snapshot
                                                .data[index].posterSmall,
                                            small: true,
                                          ),
                                          Expanded(
                                              child: Container(
                                                  padding: new EdgeInsets.only(
                                                      left: 8.0),
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Text(snapshot
                                                            .data[index].title),
                                                        Text(DateFormat(
                                                                'dd/MM/yyyy')
                                                            .format(snapshot
                                                                .data[index]
                                                                .release))
                                                      ]))),
                                          Text(snapshot.data[index].voteAverage
                                              .toString())
                                        ])));
                          },
                          itemCount: snapshot.data.length,
                        );
                      } else {
                        return Container();
                      }
                    },
                  ))
                ]))));
  }
}
