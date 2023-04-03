import 'package:dogs_ranking/features/choice_of_leves/presentation/bloc/download_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'level_choice_card.dart';

class LevelChoice extends StatelessWidget {
  bool isNormal;
  LevelChoice({required this.isNormal, super.key});

  @override
  Widget build(BuildContext context) {
    return isNormal
        ? BlocBuilder<DownloadDataBloc, DownloadDataState>(
            builder: (context, state) {
              return Visibility(
                visible: state.isVisible,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ChoiceLevelCard(
                      isNormal: isNormal,
                      text: '8',
                      isVisible: state.isVisible,
                    ),
                    ChoiceLevelCard(
                      isNormal: isNormal,
                      text: '16',
                      isVisible: state.isVisible,
                    ),
                    ChoiceLevelCard(
                      isNormal: isNormal,
                      text: '32',
                      isVisible: state.isVisible,
                    ),
                    ChoiceLevelCard(
                      isNormal: isNormal,
                      text: '64',
                      isVisible: state.isVisible,
                    ),
                  ],
                ),
              );
            },
          )
        : BlocBuilder<DownloadDataBloc, DownloadDataState>(
            builder: (context, state) {
              return Visibility(
                visible: state.isVisible,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ChoiceLevelCard(
                          isNormal: isNormal,
                          text: '8',
                          isVisible: state.isVisible,
                        ),
                        ChoiceLevelCard(
                          isNormal: isNormal,
                          text: '16',
                          isVisible: state.isVisible,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ChoiceLevelCard(
                            isNormal: isNormal,
                            text: '32',
                            isVisible: state.isVisible,
                          ),
                          ChoiceLevelCard(
                            isNormal: isNormal,
                            text: '64',
                            isVisible: state.isVisible,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          );
  }
}
