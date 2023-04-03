import 'package:bloc/bloc.dart';
import 'package:dogs_ranking/features/choice_of_leves/domain/usecases/download_data.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/entities/Dog.dart';
import '../../../../locator.dart';

part 'download_data_event.dart';
part 'download_data_state.dart';

class DownloadDataBloc extends Bloc<DownloadDataEvent, DownloadDataState> {
  late List<Dog> listOfDogs = [];
  DownloadDataBloc() : super(DownloadDataInitial(isVisible: false)) {
    on<DownloadDataEvent>((event, emit) {
    });
    on<DownloadData>(_onDownloadData);
    on<SetInitialState>(_onSetInitialState);
  }
  _onDownloadData(DownloadData event, Emitter<DownloadDataState> emit)async{
    await locator.get<DownloadDataMethod>().downloadData(64).then((value){
      if(value.length == 64){
        listOfDogs = getNameOfDogs(value);
        emit(DownloadDataSuccess(isVisible: true));
      }
      else{
        emit(DownloadDataError(isVisible: false));
      }
    });
  }
  _onSetInitialState(SetInitialState event, Emitter<DownloadDataState> emit){
    emit(DownloadDataInitial(isVisible: false));
  }
}

List<Dog> getNameOfDogs(List<Dog> listofDogs){
  List<Dog> finalListOfDogs = [];
  for(int i = 0; i < listofDogs.length; ++i){
    String dog = listofDogs[i].url.substring(listofDogs[i].url.indexOf("breeds/") + 7,listofDogs[i].url.length);
    int endIndex  = dog.indexOf('/');
    String dogName = dog.substring(0,endIndex);
    Dog finalDog = Dog(url: listofDogs[i].url);
    finalDog.name = dogName;
    finalListOfDogs.add(finalDog);
  }
  return finalListOfDogs;
} 
