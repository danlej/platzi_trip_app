import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageAPI {
  final Reference storageReference = FirebaseStorage.instance.ref();

  Future<UploadTask> uploadFile(String path, File image) async =>
      storageReference.child(path).putFile(image);
}
