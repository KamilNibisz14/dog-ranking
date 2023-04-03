import 'package:dogs_ranking/features/choice_of_leves/presentation/bloc/download_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class DogAnimation extends StatelessWidget {
  const DogAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: BlocBuilder<DownloadDataBloc, DownloadDataState>(
        builder: (context, state) {
          if(state is DownloadDataError){
            return Lottie.asset('assets/error.json', fit: BoxFit.cover);
          }
          return Lottie.asset('assets/dog.json', fit: BoxFit.cover);
        },
      )),
    );
  }
} 