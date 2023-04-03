import 'package:dogs_ranking/features/global_rank/domain/entities/ranking.dart';
import 'package:flutter/material.dart';

class RankingShowWidget extends StatelessWidget {
  bool isNormal;
  List<RankingDog> rankingDog;
  int totalVotes;
  RankingShowWidget({
    required this.isNormal,
    required this.rankingDog,
    required this.totalVotes,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double imageWidth = width / 2.5;
    double titleFontSize = isNormal? width / 15: width / 10;
    double nameFontSize = isNormal? width / 25: width / 20;
    double linearIndicatorWidth = width / 3.5;
    

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              "Ranking",
              style: TextStyle(
                fontSize: titleFontSize
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: rankingDog.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Image.network(rankingDog[index].url),
                      ),
                      Expanded(flex: 3,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 30),
                              child: Text(
                                rankingDog[index].name,
                                style: TextStyle(
                                  fontSize: nameFontSize,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  Container(
                                    width: linearIndicatorWidth,
                                    child: LinearProgressIndicator(
                                      color: Colors.blueAccent,
                                      value: rankingDog[index].votes / totalVotes,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text((rankingDog[index].votes * 100 / totalVotes).toStringAsFixed(2) + ' %'),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}