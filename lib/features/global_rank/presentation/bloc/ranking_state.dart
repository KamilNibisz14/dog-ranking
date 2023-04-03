part of 'ranking_bloc.dart';

abstract class RankingState{
  const RankingState();
  
  List<Object> get props => [];
}

class RankingInitial extends RankingState {}

class RankingWithAddedDog extends RankingState{}

class RankingShow extends RankingState {
  int allvotes;
  List<RankingDog> rankingDog;
  RankingShow({
    required this.allvotes,
    required this.rankingDog,
  });
    @override
  List<Object> get props => [allvotes, rankingDog];
}