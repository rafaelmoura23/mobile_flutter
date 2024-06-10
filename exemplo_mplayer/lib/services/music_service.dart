import '../models/music_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MusicService {
  final Uri url = "http://url do json";

  List<MusicModel> _listMusic = [];
  List<MusicModel> get listMusic => _listMusic;

  // fetch lista de musicas
  Future<List<MusicModel>> fetchListMusic() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      _listMusic = json
          .decode(response.body)
          .map<MusicModel>((item) => MusicModel.fromJson(item))
          .toList();
    }
    return _listMusic;
  }
}
