import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import '../errors/failure.dart';
import 'database_services.dart';

class FireStoreServices extends DatabaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
//-------------------------------------------------------------
  @override
  Future<void> addUser({
    required String path,
    required Map<String, dynamic> data,
    String? docId,
  }) async {
    if (docId == null) {
      await firestore.collection(path).add(data);
    } else {
      await firestore.collection(path).doc(docId).set(data);
    }
  }

//-------------------------------------------------------------
  @override
  Future<dynamic> getData({
    required String path,
    String? recordId,
    Map<String, dynamic>? query,
    String? subPath,
    String? subRecordId,
  }) async {
    if (recordId != null && subPath == null) {
      var docData = await firestore.collection(path).doc(recordId).get();
      return docData.data() as Map<String, dynamic>;
    } else {
      List<Map<String, dynamic>> dataList;
      if (subPath != null) {
        Query<Map<String, dynamic>> data =
            firestore.collection(path).doc(subRecordId).collection(subPath);
        QuerySnapshot<Map<String, dynamic>> result = await data.get();
        dataList = result.docs.map((e) => e.data()).toList();
      } else {
        Query<Map<String, dynamic>> data = firestore.collection(path);
        if (query != null) {
          if (query['orderBy'] != null) {
            var orderByField = query['orderBy'];
            var descending = query['descending'] ?? false;
            data = data.orderBy(orderByField, descending: descending);
          }
          if (query['limit'] != null) {
            var limit = query['limit'];
            data = data.limit(limit);
          }
          if (query['startAfter'] != null) {
            var startAfter = query['startAfter'];
            data = data.startAfter(startAfter);
          }
          if (query['endBefore'] != null) {
            var endBefore = query['endBefore'];
            data = data.endBefore(endBefore);
          }
          if (query['where'] != null) {
            var whereField = query['where'];
            data = data.where(whereField, isEqualTo: true);
          }
        }
        QuerySnapshot<Map<String, dynamic>> result = await data.get();
        dataList = result.docs.map((e) => e.data()).toList();
      }
      return dataList;
    }
  }

//-------------------------------------------------------------
  @override
  Future<void> updateData({
    required String path,
    required String recordId,
    required String fieldName,
    required dynamic fieldData,
  }) async {
    try {
      await firestore
          .collection(path)
          .doc(recordId)
          .update({fieldName: fieldData});
    } catch (e) {
      log("Error updating document data in Firestore: $e");
      rethrow;
    }
  }

//-------------------------------------------------------------
  @override
  Future<List<Map<String, dynamic>>> searchData({
    required String query,
    required String path,
    required String searchField,
  }) async {
    //get all docs
    final QuerySnapshot<Map<String, dynamic>> snapshot = await firestore
        .collection(path)
        .where(searchField, isGreaterThanOrEqualTo: query)
        .where(searchField, isLessThanOrEqualTo: '$query\uf8ff')
        .get();
    List<Map<String, dynamic>> dataList =
        snapshot.docs.map((doc) => doc.data()).toList();
    return dataList;
  }

//-------------------------------------------------------------
  @override
  Future<Either<Failure, void>> addReview({
    required String path,
    required String recordId,
    required Map<String, dynamic> review,
  }) async {
    //get all doc fields
    try {
      await firestore.collection(path).doc(recordId).update({
        'reviews': FieldValue.arrayUnion([review]),
      });
    } catch (e) {
      log('error in adding review in firestore services $e');
      return left(Failure(message: 'error in adding review'));
    }
    return right(null);
  }

//------------------------------------------------------------
  @override
  Future<Either<Failure, void>> removeData({
    required String path,
    String? recordId,
    String? subPath,
    String? subRecordId,
  }) async {
    //remove  all docs in collection
    if (recordId == null && subPath == null) {
      try {
        final snapshots = await firestore.collection(path).get();
        for (final doc in snapshots.docs) {
          await doc.reference.delete();
        }
        return right(null);
      } catch (e) {
        log('error in removing data from collection in firestore services $e');
        return left(Failure(message: 'error in removing data from collection'));
      }
    }
    //remove in subCollection
    else if (subPath != null) {
      try {
        final docRef = firestore.collection(path).doc(recordId);
        final subCollectionRef = docRef.collection(subPath);
        if (subRecordId != null) {
          await subCollectionRef.doc(subRecordId).delete();
          return right(null);
        } else {
          final subSnapshots = await subCollectionRef.get();
          for (final doc in subSnapshots.docs) {
            await doc.reference.delete();
          }
          return right(null);
        }
      } on Exception catch (e) {
        log('error in removing data from subCollection in firestore services $e');
        return left(
            Failure(message: 'error in removing data from sub collection'));
      }
    } else {
      try {
        await firestore.collection(path).doc(recordId).delete();
        return right(null);
      } on Exception catch (e) {
        log('error in removing data from collection in firestore services $e');
        return left(Failure(message: 'error in removing data from collection'));
      }
    }
  }

//-------------------------------------------------------------
  @override
  Future<Either<Failure, void>> addData({
    required String path,
    String? recordId,
    String? subPath,
    String? subRecordId,
    required Map<String, dynamic> data,
  }) async {
    //Add Data to collection
    if (recordId == null && subPath == null) {
      try {
        await firestore.collection(path).add(data);
        return right(null);
      } catch (e) {
        log('error in adding data to collection $e');
        return left(Failure(
            message:
                'error in adding data to firestore in firestore services'));
      }
    }
    //Add data to subCollection
    else if (subPath != null) {
      final mainPath = firestore.collection(path).doc(recordId);
      final subCollection = mainPath.collection(subPath);
      try {
        subRecordId ?? data['docId'];
        //set the name of document in firebase to be the same as the id of the document
        await subCollection.doc(subRecordId).set(data);
        return right(null);
      } catch (e) {
        log('error in adding product to favourite in firestore services $e');
        return left(Failure(message: 'error in adding product to favourite'));
      }
    }
    //Add data to document in collection
    else {
      try {
        await firestore.collection(path).doc(recordId).set(data);
        return right(null);
      } on Exception catch (e) {
        log('error in adding data to document in collection $e');
        return left(Failure(
            message: 'error in adding data to document in firestore services'));
      }
    }
  }
//--------------------------------------------------------------
}
