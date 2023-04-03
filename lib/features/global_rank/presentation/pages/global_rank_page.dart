import 'package:dogs_ranking/core/switch_view/bloc/view_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/switch_view/widgets/app_bar_swith_widget.dart';
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
        actions: const [AppBarSwitchWidget()],
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
      body: BlocBuilder<ViewBloc, ViewState>(
        builder: (context, state) {
          bool isNormal = state.isViewNormal;
          return BlocBuilder<RankingBloc, RankingState>(
            builder: (context, state) {
              if (state is RankingWithAddedDog) {
                context.read<RankingBloc>().add(GetDataFromRanking());
                return Container();
              } else if (state is RankingShow) {
                return RankingShowWidget(
                  isNormal: isNormal,
                  totalVotes: state.allvotes,
                  rankingDog: state.rankingDog,
                );
              } else {
                return Container();
              }
            },
          );
        },
      ),
    );
  }
}
