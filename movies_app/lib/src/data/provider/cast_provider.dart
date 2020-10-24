import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/src/data/model/casting.dart';

class CastProvider {
  String _apiKey = '23647234a00b353f9dbe43cc884a7150';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  final List<Cast> _castList = List();
  final _castStreamController = StreamController<List<Cast>>.broadcast();

  Function(List<Cast>) get castSink => _castStreamController.sink.add;

  Stream<List<Cast>> get castStream => _castStreamController.stream;

  void disposeStreams() {
    _castStreamController?.close();
  }

  Future<List<Cast>> getCastMovie(String movieId) async {
    final url = Uri.https(_url, '3/movie/$movieId/credits', {
      'api_key': _apiKey,
    });

    Casting casting = await _processResponse(url);
    return casting.cast;
  }

  Future<Casting> _processResponse(Uri uri) async {
    final response = await http.get(uri);
    final decodeData = json.decode(response.body);
    return Casting.fromJson(decodeData);
  }
}
