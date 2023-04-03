part of 'ranking_choice_bloc.dart';

abstract class RankingChoiceState{
  const RankingChoiceState();
  
  @override
  List<Object> get props => [];
}

class RankingChoiceInitial extends RankingChoiceState {}
class RankingChoiceGame extends RankingChoiceState{
  List<Dog> listOfDogs;
  int amount;
  int currentState;
  List<int> indexes;
  RankingChoiceGame({
    required this.listOfDogs,
    required this.amount,
    required this.currentState,
    required this.indexes
  });
  @override
  List<Object> get props => [listOfDogs, amount,currentState, indexes];
}


class EndGame extends RankingChoiceState {
  Dog dog;
  EndGame({
    required this.dog
  });
  @override
  List<Object> get props => [dog];
}