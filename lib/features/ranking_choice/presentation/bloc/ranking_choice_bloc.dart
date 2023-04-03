import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/entities/Dog.dart';

part 'ranking_choice_event.dart';
part 'ranking_choice_state.dart';

class RankingChoiceBloc extends Bloc<RankingChoiceEvent, RankingChoiceState> {
  late List<Dog> listOfDogs; 
  late List<Dog> choiceListOfDogs = [];
  late int amount;
  int currentState = 0;
  late List<int> indexes = [];

  RankingChoiceBloc() : super(RankingChoiceInitial()) {
    on<RankingChoiceEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetData>(_onGetData);
    on<NextStep>(_onNextStep);
  }
  _onGetData(GetData event, Emitter<RankingChoiceState> emit){
    listOfDogs = event.listOfDogs;
    amount = (event.amount/2).ceil();
    currentState = 0;
    indexes = [currentState, currentState + 1];
    emit(RankingChoiceGame(listOfDogs: listOfDogs, amount: amount, currentState: currentState, indexes: indexes));
  }
  _onNextStep(NextStep event, Emitter<RankingChoiceState> emit){
    currentState += 1;
    int currStateIndex = currentState * 2;
    indexes = [currStateIndex, currStateIndex + 1];
    choiceListOfDogs.add(listOfDogs[event.index]);
    if(amount == 1){
      emit(EndGame(dog: choiceListOfDogs[0]));
    }
    else if(currentState == amount){
      currentState = 0;
      currStateIndex = currentState * 2;
      amount = (amount / 2).ceil();
      listOfDogs = choiceListOfDogs;
      indexes = [currStateIndex, currStateIndex + 1];
      choiceListOfDogs = [];
      emit(RankingChoiceGame(listOfDogs: listOfDogs, amount: amount, currentState: currentState, indexes: indexes));
    }
    else{
      emit(RankingChoiceGame(listOfDogs: listOfDogs, amount: amount, currentState: currentState, indexes: indexes));
    }
  }
}

