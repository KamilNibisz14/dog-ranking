import 'package:dogs_ranking/features/choice_of_leves/presentation/bloc/download_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'level_choice_card.dart';

class LevelChoice extends StatelessWidget {
  LevelChoice({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DownloadDataBloc, DownloadDataState>(
      builder: (context, state) {
        return Visibility(
          visible: state.isVisible,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ChoiceLevelCard(
                text: '8',
                isVisible: state.isVisible,
              ),
              ChoiceLevelCard(
                text: '16',
                isVisible: state.isVisible,
              ),
              ChoiceLevelCard(
                text: '32',
                isVisible: state.isVisible,
              ),
              ChoiceLevelCard(
                text: '64',
                isVisible: state.isVisible,
              ),
            ],
          ),
        );
      },
    );
  }
}
