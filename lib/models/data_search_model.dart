import 'package:cloud_firestore/cloud_firestore.dart';

class DataModel {
  final String? name;
  final String? developer;
  final String? framework;
  final String? tool;

  DataModel({this.name, this.developer, this.framework, this.tool});

  List<DataModel> dataListFromSnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((snapshot) {
      final Map<String, dynamic> dataMap =
      snapshot.data() as Map<String, dynamic>;

      return DataModel(
          name: dataMap['name'],
          developer: dataMap['developer'],
          framework: dataMap['framework'],
          tool: dataMap['tool']);
    }).toList();
  }
}