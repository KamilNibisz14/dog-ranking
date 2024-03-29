import 'package:dogs_ranking/features/ranking_choice/presentation/bloc/ranking_choice_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/Dog.dart';

class ChoiceCard extends StatelessWidget {
  Dog dog;
  int index;
  ChoiceCard({
    required this.index,
    required this.dog,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double fontSize = width / 25;
    double containerWidth = width / 2.1;
    return Center(
      child: SizedBox(
        width: containerWidth,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  context.read<RankingChoiceBloc>().add(NextStep(index: index));
                },
                child: Image.network(dog.url, 
                errorBuilder: (_, __, ___) => const Image(image: AssetImage('assets/error_img.png')) ,
                )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
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
      ),
    );
  }
}