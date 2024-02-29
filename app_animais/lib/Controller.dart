import 'package:app_animais/Model.dart';
import 'package:flutter/widgets.dart';

class AnimalController extends ChangeNotifier{
  // atributos
  List <Animal> _listAnimal = [];

  // get da lista
  List get listarAnimais => _listAnimal;

  // adicionalAnimal
  void adicionarAnimal(String especie, String urlFoto, String urlAudio){
    Animal novoAnimal = Animal(especie, urlFoto, urlAudio);
    _listAnimal.add(novoAnimal);
  }
}