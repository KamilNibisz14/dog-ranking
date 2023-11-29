import 'package:flutter/material.dart';

import '../../../../core/entities/Dog.dart';
import 'choice_card.dart';

class MainRankingChoiceGame extends StatelessWidget {
  List<Dog> listOfDogs;
  List<int> indexes;
  MainRankingChoiceGame({
    required this.indexes,
    required this.listOfDogs,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return
    Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        ChoiceCard(index: indexes[0], dog: listOfDogs[indexes[0]]),
        ChoiceCard(index: indexes[1], dog: listOfDogs[indexes[1]])
      ],),
    );
  }
}