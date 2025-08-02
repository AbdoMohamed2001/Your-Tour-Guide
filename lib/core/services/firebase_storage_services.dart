import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:your_tour_guide/core/services/storage_services.dart';

class FirebaseStorageServices extends StorageServices {
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  FirebaseStorageServices();

  @override
  @override
  Future<String> uploadFile(File file, String path, String fileName) async {
    Reference ref = firebaseStorage.ref().child(path).child(fileName);
    UploadTask uploadTask = ref.putFile(
      file,
      SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'userId': fileName},
      ),
    );
    TaskSnapshot snapshot = await uploadTask;
    String downloadURL = await snapshot.ref.getDownloadURL();
    return downloadURL;
  }
}
