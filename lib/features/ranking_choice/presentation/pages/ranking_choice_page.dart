import 'package:dogs_ranking/features/ranking_choice/presentation/bloc/ranking_choice_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/end_gaame.dart';
import '../widgets/main_ranking_choice_game.dart';

class RankingChoicePage extends StatelessWidget {
  static const String id = "ranking_choice_page";
  const RankingChoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(

        leading: Container(),
      ),
      body: BlocBuilder<RankingChoiceBloc, RankingChoiceState>(
        builder: (context, state) {
          if (state is RankingChoiceGame) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Center(
                    child: Text(
                      "${state.currentState + 1} / ${state.amount}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize:  width / 15
                      ),
                    ),
                  ),
                ),
                MainRankingChoiceGame(indexes: state.indexes, listOfDogs: state.listOfDogs)
              ],
            );
          } else if (state is EndGame){
            return EndGameWidget(dog: state.dog,);
          }
          else{
            return Container();
          }
        },
      ),
    );
  }
}
