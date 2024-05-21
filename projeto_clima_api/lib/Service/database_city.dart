import 'package:path/path.dart';
import 'package:projeto_clima_api/Model/cidade.dart';
import 'package:sqflite/sqflite.dart';

class BancoDadosCrud {
  static const String Nome_BD = 'cidade.db'; // Nome do banco de dados
  static const String Nome_Tabela = 'cidades'; // Nome da tabela
  static const String Script_Criacao_Tabela = // Script SQL para criar a tabela
      "CREATE TABLE IF NOT EXISTS cidades(" +
          "id SERIAL PRIMARY KEY," +
          "nome TEXT, cidade boolean)";

  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), Nome_BD), // Caminho do banco de dados
      onCreate: (db, version) {
        return db.execute(
            Script_Criacao_Tabela); // Executa o script de criação da tabela quando o banco é criado
      },
      version: 1,
    );
  }

  // Método para criar uma nova cidade no banco de dados
  Future<void> create(Cidade cidade) async {
    try {
      final Database db = await _getDatabase();
      await db.insert(
          Nome_Tabela, cidade.toMap()); // Insere o contato no banco de dados
    } catch (ex) {
      print(ex);
      return;
    }
  }
}
