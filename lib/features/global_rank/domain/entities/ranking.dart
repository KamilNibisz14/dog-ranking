import 'dart:convert';

class RankingDog{

  String url;
  String name;
  int votes;

  RankingDog({
    required this.name,
    required this.url,
    required this.votes
  });

  factory RankingDog.fromJson(Map<String, dynamic> json) => RankingDog(
    url: json["url"],
    votes: json["amount"],
    name: json["name"],
  );

}        