import 'dart:io';

abstract class StorageServices {
  Future<String> uploadFile(File file, String path, String fileName);
}
