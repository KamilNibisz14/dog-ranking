import 'package:bloc/bloc.dart';
import 'package:dogs_ranking/features/global_rank/domain/entities/ranking.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/entities/Dog.dart';
import '../../../../locator.dart';
import '../../domain/usecases/add_dog_to_ranking.dart';
import '../../domain/usecases/get_ranking.dart';

part 'ranking_event.dart';
part 'ranking_state.dart';

class RankingBloc extends Bloc<RankingEvent, RankingState> {
  RankingBloc() : super(RankingInitial()) {
    on<RankingEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<AddDogToRankingEvent>(_onAddDogToRankingEvent);
    on<GetDataFromRanking>(_onGetDataFromRanking);
  }
  _onAddDogToRankingEvent(AddDogToRankingEvent event, Emitter<RankingState> emit)async{
    await locator.get<AddDogRanking>().addDogRanking(event.dog).then((value){
      emit(RankingWithAddedDog());
    });
  }
  _onGetDataFromRanking(GetDataFromRanking event, Emitter<RankingState> emit)async{
    await locator.get<GetRanking>().getRanking().then((value){
      List<RankingDog> rankingDog = value;
      double totalVotes = rankingDog.fold(0, (sum, rank) => sum + rank.votes);
      rankingDog.sort((a, b) => a.votes.compareTo(b.votes));
      List<RankingDog> reversedRankingDog =  rankingDog.reversed.toList();
      emit(RankingShow(allvotes: totalVotes.ceil(), rankingDog: reversedRankingDog));
    });
  }
}
