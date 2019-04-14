import 'package:flutter/widgets.dart';
import 'package:flutter_imdb/models/configuration.model.dart';
import 'package:flutter_imdb/services/tmdb.dart';

class Poster extends StatelessWidget {
  final String image;
  final bool small;

  Poster({this.image, this.small = false});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: tmdbService.getConfiguration(),
      builder: (BuildContext context, AsyncSnapshot<ConfigurationModel> snapshot) {
        if (tmdbService.configuration != null && this.image != null) {
          String path;
          if (this.small) {
            path =
            '${tmdbService.configuration.imageBaseUrl}${tmdbService.configuration.posterSizes[0]}${this.image}';
          } else {
            path =
            '${tmdbService.configuration.imageBaseUrl}${tmdbService.configuration.posterSizes[1]}${this.image}';
          }
          print(path);
          return Image.network(path, width: 92.0);
        } else {
          return Image.asset('assets/images/poster.png');
        }
      }
    );
  }
}
