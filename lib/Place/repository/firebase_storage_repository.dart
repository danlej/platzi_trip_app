import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:platzi_trip_app/Place/repository/firebase_storage_api.dart';

class FirebaseStorageRepository {
  final firebaseStorageAPI = FirebaseStorageAPI();

  Future<UploadTask> uploadFile(String path, File image) =>
      firebaseStorageAPI.uploadFile(path, image);
}
