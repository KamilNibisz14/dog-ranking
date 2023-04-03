import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/entities/Dog.dart';

class UpdateDogAmount{
  Future<void> updateDogAmount(Dog dog)async{
    int amount;
    var document = FirebaseFirestore.instance.collection('dog_ranking').doc(dog.name);
    var value = await document.get();
    amount = value['amount'];
    amount += 1;
    Map<String, dynamic> jsonData = {
        'amount': amount,
      };
    await document.update(jsonData); 
  }
}