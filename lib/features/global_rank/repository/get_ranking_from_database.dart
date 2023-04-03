import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogs_ranking/features/global_rank/domain/entities/ranking.dart';

class GetRankingFromDataBase{
  Future<List<RankingDog>> getRankingFromDataBase()async{
  CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('dog_ranking');
    QuerySnapshot querySnapshot = await _collectionRef.get();
    List<Map<String, dynamic>> data = [];
  querySnapshot.docs.forEach((doc) {
    data.add(doc.data() as Map<String, dynamic>);
  });
  String jsonString = jsonEncode(data);
  return List<RankingDog>.from(data.map((g) => RankingDog.fromJson(g)));
  }
}