import 'package:projeto_json/Model/livros_model.dart';

class LivrosController {
  List<Livro> _listLivros = [];

  // get
  List<Livro> get listLivros {
    return _listLivros;
  }

  void addLivro(Livro livro) {
    _listLivros.add(livro);
  }

  //json - salvar e carregar
  
}
