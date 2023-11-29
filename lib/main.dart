import 'package:dogs_ranking/features/choice_of_leves/presentation/pages/choice_level_page.dart';
import 'package:dogs_ranking/locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/choice_of_leves/presentation/bloc/download_data_bloc.dart';
import 'features/global_rank/presentation/bloc/ranking_bloc.dart';
import 'features/global_rank/presentation/pages/global_rank_page.dart';
import 'features/ranking_choice/presentation/bloc/ranking_choice_bloc.dart';
import 'features/ranking_choice/presentation/pages/ranking_choice_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setup();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => RankingChoiceBloc(),
      ),
      BlocProvider(
        create: (context) => RankingBloc(),
      ),
      BlocProvider(
        create: (context) => DownloadDataBloc(),
      ),
    ], 
    child: const MyApp(),
  ));
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dog Ranking',
      theme: ThemeData.dark(),
      initialRoute: ChoiceLevelPage.id,
      routes: {
        ChoiceLevelPage.id: (context) => const ChoiceLevelPage(),
        RankingChoicePage.id: (context) => const RankingChoicePage(),
        GlobalRankPage.id: (context) => const GlobalRankPage(),
      },
    );
  }
}
