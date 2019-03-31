class TmdbModel {
  String imageBaseUrl;
  List<String> posterSizes;

  TmdbModel();

  factory TmdbModel.fromJson(Map<String, dynamic> json) {
    TmdbModel _model = TmdbModel();
    final images = json['images'];
    _model.imageBaseUrl = images['secure_base_url'];
    _model.posterSizes = List<String>.from(images['poster_sizes']);
    return _model;
  }
}
