import '../Model/city_model.dart';
import '../Service/city_database_service.dart';

class CityDbController {
  // atributos
  List<City> _cities = [];
  final CityDbService _service = CityDbService();
  // get cities
  List<City> cities() => _cities;

  // metodos
  // list from database
  Future<List<City>> listCities() async {
    List<Map<String, dynamic>> maps = await _service.listCity();
    // for(Map<String,dynamic> map in maps){
    //     _cities.add(City.fromMap(map));
    //   }
    _cities = maps.map<City>((e) => City.fromMap(e)).toList();
    return _cities;
  }

  // adicionar cidade
  Future<void> addCity(City city) async {
    await _service.insertCity(city);
  }

  // atualizar cidade
  Future<void> updateCity(City city) async {
    await _service.updateCity(city);
  }

  // deletar cidade
  Future<void> deleteCity(String city) async {
    await _service.deleteCity(city);
  }
}
