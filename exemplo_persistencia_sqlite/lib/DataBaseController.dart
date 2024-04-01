import 'package:exemplo_persistencia_sqlite/Model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static const String DATABASE_NAME = 'contacts.db';
  static const String TABLE_NAME = 'contacts';
  static const String CREATE_CONTACTS_TABLE_SCRIPT =
      'CREATE TABLE contacts(id INTEGER PRIMARY KEY, name TEXT, email TEXT, phone TEXT, adressline1 TEXT)';

// BUSCA NO BANCO DE DADOS SE EXISTE UMA TABELA COM O NOME = DATABASE_NAME, CASO NÃO EXISTA ELE CRIA
// EXECUTA SEMPRE QUE NECESSÁRIO ABRIR A CONEXÃO COM O BANCO DE DADOS (SALVAR, DELETAR...)
  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), DataBaseHelper.DATABASE_NAME),
      onCreate: (db, version) {
        return db.execute(DataBaseHelper.CREATE_CONTACTS_TABLE_SCRIPT);
      },
      version: 1,
    );
  }

// Método para criar um novo contato no banco de dados
  Future<void> create(ContactModel model) async {
    try {
      final Database db = await _getDatabase();
      await db.insert(DataBaseHelper.TABLE_NAME,
          model.toMap()); // Insere o contato no banco de dados
    } catch (ex) {
      print(ex);
      return;
    }
  }

// Método para obter todos os contatos do banco de dados
  Future<List<ContactModel>> getContacts() async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(
          DataBaseHelper.TABLE_NAME); // Consulta todos os contatos na tabela

      return List.generate(
        maps.length,
        (i) {
          return ContactModel.fromMap(maps[
              i]); // Converte os resultados da consulta para objetos ContactModel
        },
      );
    } catch (ex) {
      print(ex);
      return [];
    }
  }

// Método para atualizar um contato no banco de dados
  Future<void> update(ContactModel model) async {
    try {
      final Database db = await _getDatabase();
      await db.update(
        DataBaseHelper.TABLE_NAME,
        model.toMap(),
        where: "id = ?", // Condição para atualizar o contato com base no ID
        whereArgs: [model.id],
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }

// Método para excluir um contato do banco de dados
  Future<void> delete(int id) async {
    try {
      final Database db = await _getDatabase();
      await db.delete(
        DataBaseHelper.TABLE_NAME,
        where: "id = ?", // Condição para excluir o contato com base no ID
        whereArgs: [id],
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }
}
