import 'package:dogs_ranking/core/switch_view/bloc/view_bloc.dart';
import 'package:dogs_ranking/features/choice_of_leves/presentation/bloc/download_data_bloc.dart';
import 'package:dogs_ranking/features/choice_of_leves/presentation/widgets/dog_animation.dart';
import 'package:dogs_ranking/features/choice_of_leves/presentation/widgets/level_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/switch_view/widgets/app_bar_swith_widget.dart';
import '../widgets/title.dart';

class ChoiceLevelPage extends StatelessWidget {
  static const String id = "choice_level_page";
  const ChoiceLevelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: const [AppBarSwitchWidget()],
        ),
        body: BlocBuilder<DownloadDataBloc, DownloadDataState>(
          builder: (context, state) {
            if(state is DownloadDataInitial){
              context.read<DownloadDataBloc>().add(DownloadData());
              return BlocBuilder<ViewBloc, ViewState>(
                builder: (context, state) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TitleWidget(
                          isNormalSize: state.isViewNormal,
                        ),
                        DogAnimation(),
                        LevelChoice(isNormal: state.isViewNormal)
                      ],
                    ),
                  );
                },
              );
            }
            else{
              return BlocBuilder<ViewBloc, ViewState>(
                builder: (context, state) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TitleWidget(
                          isNormalSize: state.isViewNormal,
                        ),
                        DogAnimation(),
                        LevelChoice(isNormal: state.isViewNormal)
                      ],
                    ),
                  );
                },
              );
            }
          },
        ));
  }
}
