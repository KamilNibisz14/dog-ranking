import '../../../core/entities/Dog.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DownloadDataFromDatabase{
  Future<List<Dog>> downloadDataFromDatabase(int amount)async{
    List<Dog> listOfDogs = [];
    for(int i = 0; i < amount; ++i){
      final response = await http.get(Uri.parse(
          'https://dog.ceo/api/breeds/image/random'));
      if(response.statusCode == 200){
        listOfDogs.add(Dog.fromJson(json.decode(response.body)));
      }
    }
    return listOfDogs;
  }
}