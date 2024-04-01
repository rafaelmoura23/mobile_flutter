import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static const String DATABASE_NAME = 'contacts.db';
  static const String TABLE_NAME = 'contacts';
  static const String CREATE_CONTACTS_TABLE_SCRIPT =
      'CREATE TABLE contacts(id INTEGER PRIMARY KEY, name TEXT, email TEXT, phone TEXT, adressLine1 TEXT)';
}

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
