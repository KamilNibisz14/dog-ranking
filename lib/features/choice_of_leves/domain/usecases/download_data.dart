import 'package:dogs_ranking/features/choice_of_leves/repository/download_data_from_database.dart';

import '../../../../core/entities/Dog.dart';
import '../../../../locator.dart';

class DownloadDataMethod{
  Future<List<Dog>> downloadData(int amount)async{
    return await locator.get<DownloadDataFromDatabase>().downloadDataFromDatabase(amount);
  }
}