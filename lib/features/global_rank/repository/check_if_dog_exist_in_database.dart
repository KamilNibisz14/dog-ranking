import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/entities/Dog.dart';

class CheckIfDogExist{
  Future<bool> checkIfDogExist(Dog dog)async{
    var document = FirebaseFirestore.instance.collection('dog_ranking').doc(dog.name);
    var value = await document.get();
    if(value.exists){
      return true;
    }
    else{
      return false;
    }
  }
}