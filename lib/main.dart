import 'package:flutter/material.dart';
import 'package:flutter_imdb/pages/home.dart';
import 'package:flutter_imdb/services/translations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(FlutterImdbApp());

class FlutterImdbApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        const TranslationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
      ],
      home: HomePage(),
    );
  }
}
