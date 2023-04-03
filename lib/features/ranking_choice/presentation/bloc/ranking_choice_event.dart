part of 'ranking_choice_bloc.dart';

abstract class RankingChoiceEvent extends Equatable {
  const RankingChoiceEvent();

  @override
  List<Object> get props => [];
}

class GetData extends RankingChoiceEvent{
  List<Dog> listOfDogs;
  int amount;
  GetData({
    required this.listOfDogs,
    required this.amount
  });
  @override
  List<Object> get props => [listOfDogs];
}
class NextStep extends RankingChoiceEvent{
  int index;
  NextStep({
    required this.index
  });
  @override
  List<Object> get props => [index];
}
