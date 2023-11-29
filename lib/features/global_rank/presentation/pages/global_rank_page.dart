import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../choice_of_leves/presentation/bloc/download_data_bloc.dart';
import '../../../choice_of_leves/presentation/pages/choice_level_page.dart';
import '../bloc/ranking_bloc.dart';
import '../widgets/ranking_show_widget.dart';

class GlobalRankPage extends StatelessWidget {
  static const String id = "global_rank_page";
  const GlobalRankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            context.read<DownloadDataBloc>().add(SetInitialState());
            Navigator.pushNamed(context, ChoiceLevelPage.id);
          },
          child: const Icon(
            Icons.house,
          ),
        ),
      ),
      body: BlocBuilder<RankingBloc, RankingState>(
        builder: (context, state) {
          if (state is RankingWithAddedDog) {
            context.read<RankingBloc>().add(GetDataFromRanking());
            return Container();
          } else if (state is RankingShow) {
            return RankingShowWidget(
              totalVotes: state.allvotes,
              rankingDog: state.rankingDog,
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
