import 'package:dogs_ranking/core/entities/Dog.dart';

import '../../../../locator.dart';
import '../../repository/check_if_dog_exist_in_database.dart';
import '../../repository/crate_new_dog_in_database.dart';
import '../../repository/update_dog_amount.dart';

class AddDogRanking{
  Future<void> addDogRanking(Dog dog) async{
    await locator.get<CheckIfDogExist>().checkIfDogExist(dog).then((value){
      if(value){
        locator.get<UpdateDogAmount>().updateDogAmount(dog);
      }else{
        locator.get<CreateNewDogInDatabase>().createNewDogInDatabase(dog);
      }
    });
  }
}