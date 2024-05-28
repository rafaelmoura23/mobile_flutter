import 'package:sqflite/sqflite.dart';

import '../Model/city_model.dart';

class CityDbService {
  final String DATABASE_NAME = 'city_db.db'; // Nome do banco de dados
  final String TABLE_NAME = 'city'; // Nome da tabela
  final String CREATE_TABLE_SCRIPT = // Script SQL para criar a tabela
      """CREATE TABLE city(
          cityname TEXT PRIMARY KEY, 
          favorites BOOLEAN
          )""";
  //método openDatabase
  Future<Database> _openDatabase() async {
    return await openDatabase(
      DATABASE_NAME,
      version: 1,
      onCreate: (db, version) => CREATE_TABLE_SCRIPT,
    );
  }
  //crud
  Future<int> insertCity(City city) async {
    Database db = await _openDatabase();
    return await db.insert(TABLE_NAME, city.toMap());
  }
}