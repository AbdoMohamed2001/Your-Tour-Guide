import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addFieldToAllDocuments({
  required String collectionPath,
  required String fieldName,
  required dynamic fieldValue,
}) async {
  final collectionRef = FirebaseFirestore.instance.collection(collectionPath);

  try {
    final snapshot = await collectionRef.get();

    final batch = FirebaseFirestore.instance.batch();

    for (var doc in snapshot.docs) {
      final docRef = collectionRef.doc(doc.id);
      batch.update(docRef, {fieldName: fieldValue});
    }

    await batch.commit();
    print('✅ Field "$fieldName" added to all documents in "$collectionPath"');
  } catch (e) {
    print('❌ Error adding field to documents: $e');
  }
}
