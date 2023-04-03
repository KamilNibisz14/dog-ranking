import '../../../../locator.dart';
import '../../repository/get_ranking_from_database.dart';
import '../entities/ranking.dart';

class GetRanking{
  Future<List<RankingDog>> getRanking()async{
    return await locator.get<GetRankingFromDataBase>().getRankingFromDataBase();
  }
}