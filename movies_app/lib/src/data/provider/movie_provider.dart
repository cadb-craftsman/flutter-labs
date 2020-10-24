import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/src/data/model/casting.dart';
import 'package:movies_app/src/data/model/movies.dart';

class MoviesProvider {
  String _apiKey = '23647234a00b353f9dbe43cc884a7150';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';
  int _countPagePopulates = 0;
  bool _loading = false;

  final List<Movie> _populateList = List();
  final _populateStreamController = StreamController<List<Movie>>.broadcast();

  Function(List<Movie>) get populateSink => _populateStreamController.sink.add;

  Stream<List<Movie>> get populateStream => _populateStreamController.stream;

  void disposeStreams() {
    _populateStreamController?.close();
  }

  Future<Movies> getInTheaters() async {
    final url = Uri.https(_url, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language});
    return await _processResponse(url);
  }

  Future<List<Movie>> getPopularMovies() async {
    if (_loading) return [];

    _loading = true;
    _countPagePopulates++;

    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apiKey,
      'language': _language,
      'page': _countPagePopulates.toString()
    });

    final response = await _processResponse(url);
    _populateList.addAll(response.movieList);
    populateSink(_populateList);
    _loading = false;
    return response.movieList;
  }

  Future<Movies> _processResponse(Uri uri) async {
    final response = await http.get(uri);
    final decodeData = json.decode(response.body);
    return Movies.fromJson(decodeData);
  }


}
