part of 'ranking_bloc.dart';

abstract class RankingEvent extends Equatable {
  const RankingEvent();

  @override
  List<Object> get props => [];
}

class AddDogToRankingEvent extends RankingEvent{
  Dog dog;
  AddDogToRankingEvent({
    required this.dog
  });
    @override
  List<Object> get props => [dog];
}

class GetDataFromRanking extends RankingEvent{}
