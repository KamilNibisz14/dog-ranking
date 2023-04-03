import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/entities/Dog.dart';

class CreateNewDogInDatabase{
  Future<void>createNewDogInDatabase(Dog dog)async{
    final dogData = FirebaseFirestore.instance.collection('dog_ranking').doc(dog.name);
      Map<String, dynamic> jsonData = {
        'amount': 1,
        'url': dog.url,
        'name': dog.name
      };
      await dogData.set(jsonData); 
  }
}