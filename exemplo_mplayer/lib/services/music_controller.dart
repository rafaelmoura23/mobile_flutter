import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../models/music_model.dart';

class MusicService {
  List<MusicModel> _list = [];
  List<MusicModel> get list => _list;

  final String url = "http://10.109.204.29:3000/music";

  //fetchList()
  Future<List<MusicModel>> fetchList() async{
    final Response  response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      final List<dynamic> list = json.decode(response.body);
      _list.clear();
      _list.addAll(list.map((e) => MusicModel.fromMap(e)).toList());
      return _list;
    }
    return [];

  }
}