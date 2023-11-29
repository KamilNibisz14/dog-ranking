import 'package:dogs_ranking/features/global_rank/presentation/bloc/ranking_bloc.dart';
import 'package:dogs_ranking/features/global_rank/presentation/pages/global_rank_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/Dog.dart';

class EndGameWidget extends StatelessWidget {
  Dog dog;
  EndGameWidget({
    required this.dog,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double fontSize = width / 20;
    double maxImgHeight = height / 1.5;
    double maxImgWidth = width / 1.5;
    return Center(
      child: GestureDetector(
        onTap: (){
          context.read<RankingBloc>().add(AddDogToRankingEvent(dog: dog));
          Navigator.pushNamed(context, GlobalRankPage.id);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20),
              child: Text(
                "Tap and go to the ranking",
                style: TextStyle(
                  fontSize: fontSize
                ),
              ),
            ),
            Container(
              constraints: BoxConstraints(
                maxHeight: maxImgHeight,
                maxWidth: maxImgWidth
              ),
              child: Image.network(dog.url)
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                dog.name,
                style: TextStyle(
                  fontSize: fontSize
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}