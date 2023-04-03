import 'package:dogs_ranking/features/choice_of_leves/presentation/pages/choice_level_page.dart';
import 'package:dogs_ranking/features/ranking_choice/presentation/pages/ranking_choice_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../ranking_choice/presentation/bloc/ranking_choice_bloc.dart';
import '../bloc/download_data_bloc.dart';

class ChoiceLevelCard extends StatelessWidget {
  bool isNormal;
  String text;
  bool isVisible;
  ChoiceLevelCard({
    required this.text,
    required this.isNormal,
    required this.isVisible,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double containerWidth = isNormal? width / 6: width / 3; 
    double fontsize = isNormal? width / 15: width / 10;   
    return GestureDetector(
      onTap: (){
        if(isVisible){
          context.read<RankingChoiceBloc>().add(GetData(listOfDogs: context.read<DownloadDataBloc>().listOfDogs, amount: int.parse(text)));
          Navigator.pushNamed(context, RankingChoicePage.id);
        }
      },
      child: Container(
        width: containerWidth,
        height: containerWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(isNormal?16:32),
          border: Border.all(width: 1, color: Colors.white)
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontsize
            ),
          ),
        ),
      ),
    );
  }
}