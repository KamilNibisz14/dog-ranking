import 'package:flutter/material.dart';

import '../../../../core/entities/Dog.dart';
import 'choice_card.dart';

class MainRankingChoiceGame extends StatelessWidget {
  bool isNormal;
  List<Dog> listOfDogs;
  List<int> indexes;
  MainRankingChoiceGame({
    required this.isNormal,
    required this.indexes,
    required this.listOfDogs,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return isNormal?
    Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        ChoiceCard(index: indexes[0], isNormal: isNormal, dog: listOfDogs[indexes[0]]),
        ChoiceCard(index: indexes[1], isNormal: isNormal, dog: listOfDogs[indexes[1]])
      ],),
    ):
    Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ChoiceCard(index: indexes[0], isNormal: isNormal, dog: listOfDogs[indexes[0]]),
            ChoiceCard(index: indexes[1], isNormal: isNormal, dog: listOfDogs[indexes[1]])
          ],
        ),
      ),
    );
  }
}