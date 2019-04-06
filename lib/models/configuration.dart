class ConfigurationModel {
  String imageBaseUrl;
  List<String> posterSizes;
  Map<int, String> genres;

  ConfigurationModel();

  factory ConfigurationModel.fromJson(Map<String, dynamic> configuration, Map<String, dynamic> genres) {
    ConfigurationModel _model = ConfigurationModel();
    final images = configuration['images'];
    _model.imageBaseUrl = images['secure_base_url'];
    _model.posterSizes = List<String>.from(images['poster_sizes']);
    // TODO : genres
    return _model;
  }
}
