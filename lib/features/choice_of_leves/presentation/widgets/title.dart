import 'package:dogs_ranking/features/choice_of_leves/presentation/bloc/download_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TitleWidget extends StatelessWidget {
  bool isNormalSize;

  TitleWidget({required this.isNormalSize, super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double fontSize = isNormalSize ? width / 15 : width / 10;
    return BlocBuilder<DownloadDataBloc, DownloadDataState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(top: 75),
          decoration: const BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 1, color: Colors.white))),
          child: Text(
            state.isVisible? "Dog ranking":"",
            style: TextStyle(fontSize: fontSize),
          ),
        );
      },
    );
  }
}
