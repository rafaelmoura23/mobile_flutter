import 'dart:html';

class Animal {
  // atributos
  String _especie; // atributo privado
  String _urlFoto;
  String _urlAudio;

  // construtor
  Animal(String this._especie, String this._urlFoto, String this._urlAudio);

  // Getter
  String get especie => _especie;
  String get urlFoto => _urlFoto;
  String get urlAudio => _urlAudio;


  // Setter
  set especie(String especie){
    this._especie = especie;
  }

  set urlFoto(String urlFoto){
    this._urlFoto = urlFoto;
  }

  set urlAudio(String urlAudio){
    this._urlAudio = urlAudio;
  }

}
