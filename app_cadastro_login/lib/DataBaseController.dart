import 'package:app_cadastro_login/Model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const String DATABASE_NAME = 'users.db'; // Nome do banco de dados
  static const String TABLE_NAME = 'users'; // Nome da tabela
  static const String
      CREATE_CONTACTS_TABLE_SCRIPT = // Script SQL para criar a tabela
      "CREATE TABLE contacts(id INTEGER PRIMARY KEY, name TEXT, password TEXT)";

  Future<Database> _getDatabase() async {
    return openDatabase(
      join(
          await getDatabasesPath(), DATABASE_NAME), // Caminho do banco de dados
      onCreate: (db, version) {
        return db.execute(
            CREATE_CONTACTS_TABLE_SCRIPT); // Executa o script de criação da tabela quando o banco é criado
      },
      version: 1,
    );
  }

  // Método para criar um novo usuario no banco de dados
  Future<void> create(UserModel model) async {
    try {
      final Database db = await _getDatabase();
      await db.insert(TABLE_NAME, model.toMap());
    } catch (ex) {
      print(ex);
      return;
    }
  }
}
