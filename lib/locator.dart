import 'package:get_it/get_it.dart';

import 'features/choice_of_leves/domain/usecases/download_data.dart';
import 'features/choice_of_leves/repository/download_data_from_database.dart';
import 'features/global_rank/domain/usecases/add_dog_to_ranking.dart';
import 'features/global_rank/domain/usecases/get_ranking.dart';
import 'features/global_rank/repository/check_if_dog_exist_in_database.dart';
import 'features/global_rank/repository/crate_new_dog_in_database.dart';
import 'features/global_rank/repository/get_ranking_from_database.dart';
import 'features/global_rank/repository/update_dog_amount.dart';
 
final locator = GetIt.instance;

 void setup(){
  locator.registerLazySingleton<DownloadDataMethod>(() => DownloadDataMethod());
  locator.registerLazySingleton<DownloadDataFromDatabase>(() => DownloadDataFromDatabase());
  locator.registerLazySingleton<AddDogRanking>(() => AddDogRanking());
  locator.registerLazySingleton<CheckIfDogExist>(() => CheckIfDogExist());
  locator.registerLazySingleton<CreateNewDogInDatabase>(() => CreateNewDogInDatabase());
  locator.registerLazySingleton<UpdateDogAmount>(() => UpdateDogAmount());
  locator.registerLazySingleton<GetRanking>(() => GetRanking());
  locator.registerLazySingleton<GetRankingFromDataBase>(() => GetRankingFromDataBase());
 }