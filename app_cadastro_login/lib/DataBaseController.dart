import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'Model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper {
  static const String DATABASE_NAME = 'users.db'; // Nome do banco de dados
  static const String TABLE_NAME = 'users'; // Nome da tabela
  static const String
      CREATE_CONTACTS_TABLE_SCRIPT = // Script SQL para criar a tabela
      "CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT, email TEXT, senha TEXT)";

  // método para iniciar o banco de dados
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

  // Método para inserir um novo usuario no banco de dados
  Future<void> create(ContactModel model) async {
    try {
      final Database db = await _getDatabase();
      await db.insert(
          TABLE_NAME, 
          model.toMap()
          );
         // insere o usuario no banco de dados
    } catch (ex) {
      print(ex);
      return;
    }
  }
  
  // metodo para autenticacao/login do usuario
 Future<bool> login(String name, String password) async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> result = await db.query(
        TABLE_NAME,
        where: 'name = ? AND senha = ?',
        whereArgs: [name, password],
      );
      print(result);
      if (result.isNotEmpty) {
        final user = result.first;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('darkMode_${user['id']}', true);
        return true;
      }
      return false;
    } catch (ex) {
      print(ex);
      return false;
    }
  }

// metodo para carregar as preferencias de cada usurio pelo id
  Future<bool> loadPreferences(int userId) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getBool('darkMode_$userId') ?? false;
    } catch (ex) {
      print(ex);
      return false;
    }
  }
}
